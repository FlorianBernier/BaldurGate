local btnOnSortDivins = 1
local sortDivin = {
    r = 0.5,
    g = 1,
    b =0.2,
    x = 150,
    y = 10,
    long = 500,
    larg = 580,
    img = love.graphics.newImage("imgSoa/menuSortDivin.png"),
    btn = {
        {x = 247, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 1 end},
        {x = 292, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 2 end},
        {x = 340, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 3 end},
        {x = 383, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 4 end},
        {x = 430, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 5 end},
        {x = 478, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 6 end},
        {x = 522, y = 101, long = 31, larg = 43, action = function () btnOnSortDivins = 7 end},

    }
}

------FONCTION DRAW------
local function drawContourBtnJeuOn()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", sortDivin.btn[btnOnSortDivins].x, sortDivin.btn[btnOnSortDivins].y, sortDivin.btn[btnOnSortDivins].long, sortDivin.btn[btnOnSortDivins].larg)
end

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #sortDivin.btn do
        if colisionPointRect(x, y, sortDivin.btn[i].x, sortDivin.btn[i].y, sortDivin.btn[i].long, sortDivin.btn[i].larg) then
            sortDivin.btn[i].action()
        end
    end
end



sortDivin.draw = function()
    love.graphics.draw(sortDivin.img, sortDivin.x, sortDivin.y, 0, sortDivin.long / sortDivin.img:getWidth(), sortDivin.larg /
    sortDivin.img:getHeight(), 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Sorts divins", 365, 28)
    love.graphics.print("Perso", 382, 66)
    love.graphics.print("MEMORISER", 205, 505)
    love.graphics.print("MEMORISER : 0/6", 334, 505)



    drawContourBtnJeuOn()

end

-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
sortDivin.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return sortDivin