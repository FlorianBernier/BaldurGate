

------VARIABLE------
--mode pose
GameInPause = false

-- Changement taille écrant (800x600) ou full screen + camera
screenWidth = 0
screenHeight = 0
scale_x = 0
scale_y = 0
--setFullScreen : change taille ecrant true or false
setFullScreen = true
Camera_x = -1000
Camera_y = -1443
Camera_speed = 300
------TABLEAU------

-- mesMenu : de 1 a 9
local mesMenu = {

    --RETOUR JEU --1--
    require("menu.retourJeu"),

    --CARTE --2--
    require("menu.carte"),

    --QUETE --3--
    require("menu.quete"),

    --INVENTAIRE --4--
    require("menu.inventaire"),

    --STAT --5--
    require("menu.stat"),

    --SORT PROFANE --6--
    require("menu.sortProfane"),

    --SORT DIVIN --7--
    require("menu.sortDivin"),

    --OPTION --8--
    require("menu.option"),

    --AIDE --9--
    require("menu.aide"),
}

-- mesHero : de 13 a 18 (6 hero)
local mesHero = require("personnage.hero")




-- bordureBtn : position / dimension
bordureBtnJeu = {
    {x = 0, y = 0, long = 35, larg = 600,},
    {x = 765, y = 0, long = 35, larg = 600}
}


btnOn = 1
heroOn = 13
-- btn jeu : position / dimension / nom / image / key / action btnOn pour 1 a 11 / action heroOn pour 13 a 18
btnJeu = {
    {x = 2, y = 19, long = 31, larg = 38, nom = "Retour jeu", img = love.graphics.newImage("imgSoa/iconeRetourJeu.png"), key = "a", action = function () btnOn = 1 end}, --1
    {x = 2, y = 59, long = 31, larg = 38, nom = "Carte", img = love.graphics.newImage("imgSoa/iconeCarte.png"), key = "m", action = function () btnOn = 2 end}, --2
    {x = 2, y = 99, long = 31, larg = 38, nom = "Quete", img = love.graphics.newImage("imgSoa/iconeQuete.png"), key = "q", action = function () btnOn = 3 end}, --3
    {x = 2, y = 139, long = 31, larg = 38, nom = "Inventaire", img = love.graphics.newImage("imgSoa/iconeInventaire.png"), key = "w", action = function () btnOn = 4 end}, --4
    {x = 2, y = 179, long = 31, larg = 38, nom = "Stat", img = love.graphics.newImage("imgSoa/iconeStat.png"), key = "x", action = function () btnOn = 5 end}, --5
    {x = 2, y = 219, long = 31, larg = 38, nom = "Sort \nprofane", img = love.graphics.newImage("imgSoa/iconeSortProfane.png"), key = "c", action = function () btnOn = 6 end}, --6
    {x = 2, y = 259, long = 31, larg = 38, nom = "Sort divin", img = love.graphics.newImage("imgSoa/iconeSortDivin.png"), key = "v", action = function () btnOn = 7 end}, --7
    {x = 2, y = 299, long = 31, larg = 38, nom = "option", img = love.graphics.newImage("imgSoa/iconeOption.png"), key = "o", action = function () btnOn = 8 end}, --8
    {x = 2, y = 399, long = 31, larg = 38, nom = "Aide", img = love.graphics.newImage("imgSoa/iconeAide.png"), key = nil, action = function () mesMenu[9].setBtnRetour(btnOn) btnOn = 9  end}, --9
    {x = 2, y = 439, long = 31, larg = 38, nom = "Sauvegarde", img = love.graphics.newImage("imgSoa/iconeSauvegarde.png"), key = "s", action = function () btnOn = 10 end}, --10
    {x = 2, y =  479, long = 31, larg = 38, nom = "Repos", img = love.graphics.newImage("imgSoa/iconeRepos.png"), key = "z", action = function () btnOn = 11 end}, --11
    {x = 2, y =  539, long = 31, larg = 38, nom = "Pause", img = love.graphics.newImage("imgSoa/iconePause.png"), key = "space", action = function () GameInPause = not GameInPause end}, --12

    {x = 767, y = 19, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso1.png"), key = "1", action = function () mesHero.selectHero(1) heroOn = 13 end}, --13
    {x = 767, y = 79, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso2.png"), key = "2", action = function () mesHero.selectHero(2)  heroOn = 14 end}, --14
    {x = 767, y = 139, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso3.png"), key = "3", action = function () mesHero.selectHero(3) heroOn = 15 end}, --15
    {x = 767, y = 199, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso4.png"), key = "4", action = function () mesHero.selectHero(4)heroOn = 16 end}, --16
    {x = 767, y = 259, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso5.png"), key = "5", action = function () mesHero.selectHero(5)heroOn = 17 end}, --17
    {x = 767, y = 319, long = 31, larg = 57, nom = "Perso", img = love.graphics.newImage("imgSoa/iconePerso6.png"), key = "6", action = function () mesHero.selectHero(6) heroOn = 18 end}, --18
    {x = 767, y = 419, long = 31, larg = 38, nom = "Pass", img = love.graphics.newImage("imgSoa/iconePass.png"), key = "nil",}, --19
    {x = 767, y = 459, long = 31, larg = 38, nom = "détail", img = love.graphics.newImage("imgSoa/iconeRevelerDetail.png"), key = "e."}, --20
    {x = 767, y = 499, long = 31, larg = 38, nom = "IA grp", img = love.graphics.newImage("imgSoa/iconeIAgroupe.png"), key = "r."}, --21
    {x = 767, y = 539, long = 31, larg = 38, nom = "Sélect \nperso", img = love.graphics.newImage("imgSoa/iconeSelectionnerPerso.png"), key = "tab" ,action = function() mesHero.selectAllHero() end}, --22
}


------FONCTION LOAD------

------FONCTION UPDATE------

--moveCamera : permet de deplacer la camera dans retour jeu dans toute les direction 
function moveCamera(dt)
    local x, y = love.mouse.getPosition()
    if (setFullScreen) then
        x = x / scale_x
        y = y / scale_y
    end

    if x < 5 then Camera_x = Camera_x + Camera_speed * dt end
    if x > 795 then Camera_x = Camera_x - Camera_speed * dt end
    if y < 5 then Camera_y = Camera_y + Camera_speed * dt end
    if y > 595 then Camera_y = Camera_y - Camera_speed * dt end
  
end

------FONCTION DRAW------

--dessine les bordureBtnJeu
function drawBordureBtnJeu()

    --dessine les bordureBtnJeu
    love.graphics.setColor(0.2,0.2,0.2)
    for i = 1, #bordureBtnJeu do
        love.graphics.rectangle("fill", bordureBtnJeu[i].x, bordureBtnJeu[i].y, bordureBtnJeu[i].long, bordureBtnJeu[i].larg)
    end
    love.graphics.setColor(1,1,1)
end

--dessine les btnJeu et les imageBtnJeu
function drawBtnJeuImageBtnJeu()
    --dessine les btnJeu 
    for i = 1, #btnJeu do
        if i >= 13 and i <= 18 then
            love.graphics.rectangle("fill", btnJeu[i].x, btnJeu[i].y, btnJeu[i].long, btnJeu[i].larg)
            love.graphics.draw(btnJeu[i].img, btnJeu[i].x, btnJeu[i].y, 0, btnJeu[i].long / btnJeu[i].img:getWidth(), btnJeu[i].larg /
            btnJeu[i].img:getHeight(), 0, 0)
        else
            love.graphics.rectangle("fill", btnJeu[i].x, btnJeu[i].y, btnJeu[i].long, btnJeu[i].larg)
            love.graphics.draw(btnJeu[i].img, btnJeu[i].x, btnJeu[i].y, 0, btnJeu[i].long / btnJeu[i].img:getWidth(), btnJeu[i].larg /
            btnJeu[i].img:getHeight(), 0, 0)
        end
    end
end

--dessine les bordureBtnJeu pour le btnJeu sélectionner
function drawContourBtnJeuOn()
    love.graphics.rectangle("line", btnJeu[btnOn].x, btnJeu[btnOn].y, btnJeu[btnOn].long, btnJeu[btnOn].larg)
    for i = 1, #mesHero.list do
        if mesHero.list[i].isSelected then
            love.graphics.rectangle("line", btnJeu[i + 12].x, btnJeu[i + 12].y, btnJeu[i + 12].long, btnJeu[i + 12].larg)            
        end
    end
    if GameInPause then
        love.graphics.rectangle("line", btnJeu[12].x, btnJeu[12].y, btnJeu[12].long, btnJeu[12].larg)
    end
end
------FONCTION KEYPRESSED------


------FONCTION MOUSEPRESSED------

--colision de la souris avec un btnJeu
function colisionSourisBtnJeu(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #btnJeu do
        if colisionPointRect(x, y, btnJeu[i].x, btnJeu[i].y, btnJeu[i].long, btnJeu[i].larg) then
            btnJeu[i].action()
        end
    end
end


------FONCTION UTILE------

--colisionPointRect : detecte la colision entre un point x,y et un rectangle 
function colisionPointRect(x1,y1,x2,y2,w,h)
    return x1 > x2 and x1 < x2 + w and y1 > y2 and y1 < y2 + h
end

--DistanceDeuxPoints : detecte la distance entre 2 points 
function DistanceDeuxPoints(x1,y1,x2,y2)
    return math.sqrt( math.abs(x1 - x2) * math.abs(x1 - x2)  + math.abs(y1 - y2) * math.abs(y1 - y2) )
end



------------------------------------------------------------LE JEU----------------------------------------------------------------------


-----LOAD----- : ACTION DU JEU AU DEMARAGE
function love.load()
    mesHero.load()
    -- Changement taille écrant (800x600) ou full screen selon variable true/false
    if (setFullScreen) then
        love.window.setFullscreen(true)
        screenWidth, screenHeight = love.window.getMode()
        scale_x = screenWidth / 800
        scale_y = screenHeight / 600
    end
    -----------------------------------

    video = love.graphics.newVideo("video/narateur.ogv")
    video:play()

    --créé new hero
    mesHero.create(80,nil,"Soanara", 1400, 1700)
    mesHero.create(80,nil,"Soanara", 1400, 1700)
    mesHero.create(80,nil,"Soanara", 1400, 1700)
    mesHero.create(80,nil,"Soanara", 1400, 1700)
    mesHero.create(80,nil,"Soanara", 1400, 1700)
    mesHero.create(80,nil,"Soanara", 1400, 1700)

    
end



-----UPDATE----- : ACTION DU JEU A CHAQUE FRAME  
function love.update(dt)
    -- TEMPORAIRE (19/01)
    if btnOn == 1 then mesHero.update(dt) end



    -----------------------------------
    if love.mouse.isDown(1) then
        print(love.mouse.getPosition())
    end
    moveCamera(dt)
end



-----DRAW----- : DESSINE CE QUE TU VOIS A L'ECRAN
function love.draw()
    --full screen
    if (setFullScreen) then love.graphics.scale(scale_x,scale_y) end
    ----------------------------------------------------


    love.graphics.setColor(mesMenu[btnOn].r, mesMenu[btnOn].g, mesMenu[btnOn].b,0.5)
    love.graphics.draw(btnJeu[1].img,  35,0, 0, 730 / btnJeu[1].img:getWidth(), 600 / btnJeu[1].img:getHeight(), 0, 0)



    love.graphics.setColor(1, 1, 1)
    mesMenu[btnOn].draw()

    love.graphics.draw(video, 200, 380, 0, 100 / video:getWidth(), 121 /video:getHeight(), 0, 0)


    drawBordureBtnJeu()
    drawBtnJeuImageBtnJeu()
    drawContourBtnJeuOn()


end



-----KEYPRESSED----- : ACTION DU JOUEUR CLAVIER
function love.keypressed(key)

    for i = 1, #btnJeu do
        if key == btnJeu[i].key then
            btnJeu[i].action()

        end
    end
    ----------------------------------
    print(key)
end



-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
function love.mousepressed(x, y, button)
    --full screen
    if (setFullScreen) then
        x = x / scale_x
        y = y / scale_y
    end
    ----------------------------------------------------
   if button == 1 then
        colisionSourisBtnJeu(x, y)
        mesMenu[btnOn].mousepressed(x, y)
   end
end





