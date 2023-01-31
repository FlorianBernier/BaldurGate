
------VARIABLE------


------TABLEAU------


local mesHero = require("personnage.hero")

local retourJeu = {
    r = 0.4,
    g = 1,
    b =0.5,
    x = 0,
    y = 0,
    long = 0,
    larg = 0,
}


local btnOnMenuActionRapide = 1
ModePositionPerso = 1
--menuActionRapide : cree un btn pour chaque action rapide des personnage
local menuActionRapide = {
    x = 200, y = 500, long = 400, larg = 100,
    img1 = love.graphics.newImage("imgSoa/menuAccesRapide1.png"),
    img2 = love.graphics.newImage("imgSoa/menuAccesRapide2.png"),
    btn1 = {
        {x = 257, y = 568, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 1 end},
        {x = 282, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 2 end},
        {x = 308, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 3 end},
        {x = 334, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 4 end},
        {x = 366, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 5 end},
        {x = 391, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 6 end},
        {x = 416, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 7 end},
        {x = 441, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 8 end},
        {x = 473, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 9 end},
        {x = 498, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 10 end},
        {x = 524, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 11 end},
        {x = 549, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 12 end},
    },
    btn2 = {
        {x = 257, y = 568, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 1 end},
        {x = 282, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 2 end},
        {x = 308, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 3 end},
        {x = 441, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 4 ModePositionPerso = 1 end},
        {x = 473, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 5 ModePositionPerso = 2 end},
        {x = 498, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 6 ModePositionPerso = 3 end},
        {x = 524, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 7 ModePositionPerso = 4 end},
        {x = 549, y = 567, long = 23, larg = 30, action = function () btnOnMenuActionRapide = 8 ModePositionPerso = 5 end},
    }
}

-- tableau de création des images
local img = {
    love.graphics.newImage("imgSoa/carte.png"),

}

-- tableau des colisions
Colision = {
    circle = {
        {950,550,50},{970,525,50},{990,490,50},
        
        

    },
    square = {
        {1300,1500,100,100},
        {0,0,0,0},

    }
}

-- tableau des textures
texture = {
    {0, 0, img[1]},
}




------FONCTION LOAD------

------FONCTION UPDATE------

------FONCTION DRAW------

-- drawColisionCircleAndSquare : dessine les cercle et les rectange de colision
function drawColisionCircleAndSquare()
    for i = 1 ,#Colision.circle do
        local j = Colision.circle[i]
        love.graphics.circle("line",j[1] + Camera_x,j[2] + Camera_y,j[3] )
    end
    for i = 1 ,#Colision.square do
        local j = Colision.square[i]
        love.graphics.rectangle("line",j[1] +Camera_x, j[2] + Camera_y,j[3],j[3] )
    end
end

--drawImageJeu : dessine chacune des images concernant le menu retour jeu 
function drawImageJeu()
    for i = 1, #texture do
        love.graphics.draw(texture[i][3],texture[i][1] + Camera_x, texture[i][2] + Camera_y,0,1,1)
    end

end

-- drawMenuActionRapide : affiche le menu des actions rapide
function drawMenuActionRapide()
    if heroOn == 13 then
        love.graphics.draw(menuActionRapide.img1, menuActionRapide.x, menuActionRapide.y, 0, menuActionRapide.long / menuActionRapide.img1:getWidth(), menuActionRapide.larg /
        menuActionRapide.img1:getHeight(), 0, 0)
        love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", menuActionRapide.btn1[btnOnMenuActionRapide].x, menuActionRapide.btn1[btnOnMenuActionRapide].y, menuActionRapide.btn1[btnOnMenuActionRapide].long, menuActionRapide.btn1[btnOnMenuActionRapide].larg)
    else
        love.graphics.draw(menuActionRapide.img2, menuActionRapide.x, menuActionRapide.y, 0, menuActionRapide.long / menuActionRapide.img2:getWidth(), menuActionRapide.larg /
        menuActionRapide.img2:getHeight(), 0, 0)
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("line", menuActionRapide.btn2[btnOnMenuActionRapide].x, menuActionRapide.btn2[btnOnMenuActionRapide].y, menuActionRapide.btn2[btnOnMenuActionRapide].long, menuActionRapide.btn2[btnOnMenuActionRapide].larg)
    end
end


------FONCTION MOUSEPRESSED------

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #menuActionRapide.btn1 do
        if colisionPointRect(x, y, menuActionRapide.btn1[i].x, menuActionRapide.btn1[i].y, menuActionRapide.btn1[i].long, menuActionRapide.btn1[i].larg) then
            menuActionRapide.btn1[i].action()
        end
    end
    for i = 1, #menuActionRapide.btn2 do
        if colisionPointRect(x, y, menuActionRapide.btn2[i].x, menuActionRapide.btn2[i].y, menuActionRapide.btn2[i].long, menuActionRapide.btn2[i].larg) then
            menuActionRapide.btn2[i].action()
        end
    end
end

------FONCTION UTILE------


------------------------------------------------------------RETOUR JEU----------------------------------------------------------------------

-----LOAD----- : ACTION DU JEU AU DEMARAGE
retourJeu.load = function ()
    
end

-----UPDATE----- : ACTION DU JEU A CHAQUE FRAME
retourJeu.update = function (dt)
end

-----DRAW----- : DESSINE CE QUE TU VOIS A L'ECRAN
retourJeu.draw = function()

    drawImageJeu()
    drawColisionCircleAndSquare()
    mesHero.draw()

    drawMenuActionRapide()


end




-- Collision entre les cercles de la carte et un cercle en parametre (personnage est un cercle) A VOIR
CollideCircleCircle = function (x,y,rad)
    for i = 1, #Colision.circle do
        local c = Colision.circle[i]
        if DistanceDeuxPoints(c[1],c[2], x, y) < rad + c[3] then
            return true
        end
    end
    return false
end






-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
retourJeu.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return retourJeu