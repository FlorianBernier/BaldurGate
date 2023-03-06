




------VARIABLE------

------TABLEAU------

--Tableau des heros
local hero = {}
      hero.list = {}
-- dans "pPvMax" p des un parametre
hero.create = function (pPvMax, pImg, pNom, pX, pY)
    newHero = {
        pvMax = pPvMax, -- Pv max
        pv = pPvMax, -- Pv actuel
        img = pImg, -- Image 
        nom = pNom, -- Nom 
        x = pX, -- Position X
        y = pY, -- Position Y
        isSelected = false, -- Es selectionner (faux)
        radius = 10,  -- Taille du perso
        -- Destination (variable concernant le deplacement d'un personnage jusqu'a son point d'arriver)
        ox = 0, -- Destination x
        oy = 0, -- Destination y
        oa = true -- Arriver a destination (vrais)
    }

    -- sert a ne pas créé plus de 6 hero max
    if #hero.list < 6 then
        table.insert(hero.list, newHero)
    end
end

positionPerso = {
    {   {0,0}, {0,40}, {40,0}, {40,40}, {0,80}, {40,80} },
    {   {0,0}, {40,0}, {-40,0}, {20,-40}, {-20,-40}, {0,-80} },
    {   {0,0}, {-40,0}, {40,0}, {0,40}, {0,80}, {0,120} },
    {   {0,0}, {-20,40}, {20,40}, {-40,80}, {0,80}, {40,80} },
    {   {0,0}, {-20,-40}, {20,-40}, {-40,0}, {40,0}, {0,40} },
}

mouseSelect = {
    x = 0,
    y = 0,
    long = 0,
    larg = 0,
    isDown = false
}



animation = {
    img = love.graphics.newImage("images/luffy.png"),
    img2 = love.graphics.newImage("images/sangoku.png"),
    img3 = love.graphics.newImage("images/sandy.png"),
    img4 = love.graphics.newImage("images/usopp.png"),
    img5 = love.graphics.newImage("images/robine.png"),
    img6 = love.graphics.newImage("images/nami.png")

}


------FONCTION LOAD------

------FONCTION UPDATE------

-- updateGreenSquare : permet de selectionner 1 ou plusieur personnage avec le clic gauche de la souris en restant appuyer puis en relachant
function updateGreenSquare()

    local x, y = love.mouse.getPosition()
    if (setFullScreen) then
        x = x / scale_x
        y = y / scale_y
    end


    if love.mouse.isDown(1) then
        if mouseSelect.isDown == false and x > bordureBtnJeu[1].long and x < bordureBtnJeu[2].x  then
            mouseSelect.isDown = true
            mouseSelect.x = x
            mouseSelect.y = y
        end
        mouseSelect.long = x - mouseSelect.x
        mouseSelect.larg = y - mouseSelect.y
    else
        -- On relache
        if mouseSelect.isDown == true then
            for i = 1, #hero.list do
                local h = hero.list[i]
                local m = mouseSelect
                h.isSelected = colisionPointRect( 
                    h.x + Camera_x, 
                    h.y + Camera_y, 
                    (m.long < 0 and m.x + m.long or m.x)-h.radius,
                    (m.larg < 0 and m.y + m.larg or m.y)-h.radius,
                    math.abs(m.long)+h.radius*2,
                    math.abs(m.larg)+h.radius*2
                ) 
            end
            
        end
        mouseSelect.isDown = false
    end

end

-- updatMoveHero : permet de deplacer 1 ou plusieur personnage avec le clic droit de la souris
function updatMoveHero(dt)



    -- deplacement des personnage
    local x, y = love.mouse.getPosition()
    if (setFullScreen) then
        x = x / scale_x
        y = y / scale_y
    end
    x = x - Camera_x
    y = y - Camera_y


    local vitesse = 300

    local noSelection = 0
    for i = 1, #hero.list do
        local h = hero.list[i]
        if h.isSelected then noSelection = noSelection + 1 end 
        
        if h.isSelected then
            if love.mouse.isDown(2) then
                h.ox = x + positionPerso[ModePositionPerso][noSelection][1]
                h.oy = y + positionPerso[ModePositionPerso][noSelection][2]
                h.oa = false
            end
        end

        if not GameInPause then
            if h.oa == false then
                local dist = DistanceDeuxPoints(h.ox, h.oy, h.x, h.y)
                if dist > 3 then
                    local old_x = h.x
                    local old_y = h.y

                    h.x = h.x + (h.ox - h.x) / dist * vitesse * dt
                    h.y = h.y + (h.oy - h.y) / dist * vitesse * dt

                    if CollideCircleCircle(h.x, h.y, h.radius) then
                        h.x = old_x
                        h.y = old_y
                    end
                else
                    h.oa = true
                end
            end
        end
    end
end

------FONCTION DRAW------

--dessine les hero et entour d'un cercle vert le hero sélectionner
local function drawHeroHeroSelect()
    for i = 1, #hero.list do
        local h = hero.list[i]

        love.graphics.circle("fill",h.x + Camera_x, h.y  + Camera_y, h.radius)
        love.graphics.setColor(0,1,0)

        if h.isSelected then
            love.graphics.circle("line",h.x + Camera_x,h.y + Camera_y,11)
        end

        love.graphics.setColor(1,1,1)
    end
end

-- dessine le rectangle de selection de peronnage
function drawGreenSquare()
    if mouseSelect.isDown == true then
        love.graphics.setColor(0,1,0)
        love.graphics.rectangle("line", mouseSelect.x, mouseSelect.y, mouseSelect.long, mouseSelect.larg)
        love.graphics.setColor(1,1,1)            
    end
end

-- dessine un cercle vert qui represente la destination des hero
function drawGreenCircle()
    for i = 1, #hero.list do
        local h = hero.list[i]
        if not h.oa then
            love.graphics.setColor(0,1,0)
            love.graphics.circle("line",h.ox + Camera_x, h.oy + Camera_y, h.radius)            
            love.graphics.setColor(1,1,1)
        end
    end
end

------FONCTION KEYPRESSED------

------FONCTION MOUSEPRESSED------

------FONCTION UTILE------
--selectionne tout les héros


------------------------------------------------------------HERO----------------------------------------------------------------------

-----LOAD----- : ACTION DU JEU AU DEMARAGE
hero.load = function ()

    
    animation.quad = {}
    for i = 0, 6 do
        animation.quad[i+1] = love.graphics.newQuad(i * 64,448 - 64,64,64, animation.img)

    end
    animation.nbImg = 6
    animation.imgActuelle = 0
end


-----UPDATE----- : ACTION DU JEU A CHAQUE FRAME
hero.update = function (dt)

    animation.imgActuelle = animation.imgActuelle + animation.nbImg * dt
    if animation.imgActuelle >= animation.nbImg then
        animation.imgActuelle = 0
    end

    updateGreenSquare()
    updatMoveHero(dt)

end




-----DRAW----- : DESSINE CE QUE TU VOIS A L'ECRAN
hero.draw = function()




    drawHeroHeroSelect()
    drawGreenSquare()
    drawGreenCircle()

    love.graphics.draw(animation.img, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[1].x + Camera_x - 32,hero.list[1].y + Camera_y - 64)
    love.graphics.draw(animation.img2, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[2].x + Camera_x - 32,hero.list[2].y + Camera_y - 64)
    love.graphics.draw(animation.img3, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[3].x + Camera_x - 32,hero.list[3].y + Camera_y - 64)
    love.graphics.draw(animation.img4, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[4].x + Camera_x - 32,hero.list[4].y + Camera_y - 64)
    love.graphics.draw(animation.img5, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[5].x + Camera_x - 32,hero.list[5].y + Camera_y - 64)
    love.graphics.draw(animation.img6, animation.quad[math.floor(animation.imgActuelle)+1  ],hero.list[6].x + Camera_x - 32,hero.list[6].y + Camera_y - 64)
end




-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
hero.mousepressed = function(x, y)
end


-----AUTRE FONCTION--------- : ?
--selectionne un hero a partir de la liste de hero iconeHero
hero.selectHero = function (heroId)
    for i = 1, #hero.list do
        local h = hero.list[i]
        h.isSelected = false
    end
    if heroId > 0 and heroId <= #hero.list then
        hero.list[heroId].isSelected = true
    end
end


hero.selectAllHero = function()
    for i = 1, #hero.list do
        local h = hero.list[i]
        h.isSelected = true
    end
end


return hero

