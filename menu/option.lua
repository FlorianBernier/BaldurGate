------TABLEAU------
local btnOnOption = 1
local option = {
    r = 0,
    g = 0,
    b =0,
    x = 150,
    y = 50,
    long = 500,
    larg = 500,
    img = love.graphics.newImage("imgSoa/menuOption.png"),
    btn = {
        {x = 180, y = 205, long = 130, larg = 55, action = function () btnOnOption = 1 end},--1
        {x = 180, y = 270, long = 130, larg = 55, action = function () btnOnOption = 2 end},--2
        {x = 180, y = 337, long = 130, larg = 55, action = function () btnOnOption = 3 end},--3
        {x = 485, y = 205, long = 130, larg = 55, action = function () btnOnOption = 4 end},--4
        {x = 485, y = 269, long = 130, larg = 55, action = function () btnOnOption = 5 end},--5
        {x = 485, y = 337, long = 130, larg = 55, action = function () btnOnOption = 6 end},--6
        {x = 319, y = 485, long = 163, larg = 30, action = function () btnOn = 1 end},--7


    }

}

------FONCTION DRAW------
local function drawContourBtnJeuOn()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("line", option.btn[btnOnOption].x, option.btn[btnOnOption].y, option.btn[btnOnOption].long, option.btn[btnOnOption].larg)
end

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #option.btn do
        if colisionPointRect(x, y, option.btn[i].x, option.btn[i].y, option.btn[i].long, option.btn[i].larg) then
            option.btn[i].action()
        end
    end
end

-----DRAW----- : DESSINE CE QUE TU VOIS A L'ECRAN
option.draw = function()

    for i = 1, #option.btn do
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", option.btn[i].x, option.btn[i].y, option.btn[i].long, option.btn[i].larg)
    end

    love.graphics.draw(option.img, option.x, option.y, 0, option.long / option.img:getWidth(), option.larg /
    option.img:getHeight(), 0, 0)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Options", 375, 80)
    love.graphics.print("Version", 377, 100)
    love.graphics.print("CHARGER PARTIE", 195, 227)
    love.graphics.print("QUITTER PARTIE", 190, 292)
    love.graphics.print("SAUVEGARDER PARTIE", 175, 358)
    love.graphics.print("SON", 535, 227)
    love.graphics.print("GRAPHISMES", 515, 292)
    love.graphics.print("JEU", 535, 358)
    love.graphics.print("RETOUR AU JEU", 353, 493)

    drawContourBtnJeuOn()
end

-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
option.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return option


