local btnOnCarte = 1

Cl = 2
local carte = {
    r = 1,
    g = 0.5,
    b =0.5,
    x = 200,
    y = 0,
    long = 400,
    larg = 50,
    img = love.graphics.newImage("imgSoa/menuCarte.png"),
    btn = {
        {x = 320, y = 8, long = 15, larg = 15, action = function () btnOnCarte = 1 end},
        {x = 320, y = 27, long = 15, larg = 15, action = function () btnOnCarte = 2 end},
        {x = 462, y = 13, long = 122, larg = 22, action = function () btnOnCarte = 3 end},
}
}

------FONCTION DRAW------
local function drawContourBtnJeuOn()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", carte.btn[btnOnCarte].x, carte.btn[btnOnCarte].y, carte.btn[btnOnCarte].long, carte.btn[btnOnCarte].larg)
end

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #carte.btn do
        if colisionPointRect(x, y, carte.btn[i].x, carte.btn[i].y, carte.btn[i].long, carte.btn[i].larg) then
            carte.btn[i].action()
        end
    end
end




carte.draw = function()
    love.graphics.draw(carte.img, carte.x, carte.y, 0, carte.long / carte.img:getWidth(), carte.larg /
    carte.img:getHeight(), 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Lieu", 250, 20)
    love.graphics.print("Partie accessibles", 340, 7)
    love.graphics.print("Notes de la cartes", 340, 27)
    love.graphics.print("CARTE DU MONDE", 468, 17)
    --CARTE
    --rectangle carte
    love.graphics.rectangle("line", 150, 50, 500, 540)


    drawContourBtnJeuOn()
end

carte.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return carte
