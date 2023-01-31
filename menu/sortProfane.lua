local btnOnSortProfane = 1
local sortProfane = {
    r = 0.8,
    g = 1,
    b =0.5,
    x = 150,
    y = 10,
    long = 500,
    larg = 580,
    img = love.graphics.newImage("imgSoa/menuSortProfane.png"),
    btn = {
        {x = 247, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 1 end},
        {x = 281, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 2 end},
        {x = 314, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 3 end},
        {x = 349, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 4 end},
        {x = 383, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 5 end},
        {x = 418, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 6 end},
        {x = 452, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 7 end},
        {x = 487, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 8 end},
        {x = 523, y = 101, long = 31, larg = 43, action = function () btnOnSortProfane = 9 end},

    }
}

------FONCTION DRAW------
local function drawContourBtnJeuOn()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", sortProfane.btn[btnOnSortProfane].x, sortProfane.btn[btnOnSortProfane].y, sortProfane.btn[btnOnSortProfane].long, sortProfane.btn[btnOnSortProfane].larg)
end

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #sortProfane.btn do
        if colisionPointRect(x, y, sortProfane.btn[i].x, sortProfane.btn[i].y, sortProfane.btn[i].long, sortProfane.btn[i].larg) then
            sortProfane.btn[i].action()
        end
    end
end





sortProfane.draw = function()
    love.graphics.draw(sortProfane.img, sortProfane.x, sortProfane.y, 0, sortProfane.long / sortProfane.img:getWidth(), sortProfane.larg /
    sortProfane.img:getHeight(), 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Sorts profanes", 361, 28)
    love.graphics.print("Perso", 382, 66)
    love.graphics.print("MEMORISER", 215, 502)
    love.graphics.print("MEMORISER : 0/6", 345, 500)


    drawContourBtnJeuOn()

end

sortProfane.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return sortProfane