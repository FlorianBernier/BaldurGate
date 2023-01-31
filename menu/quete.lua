------TABLEAU------
local quete = {
    r = 0.5,
    g = 1,
    b =0.5,
    x = 45,
    y = 10,
    long = 300,
    larg = 580,
    img = love.graphics.newImage("imgSoa/menuQuete.png"),
    btn = {
    {x = 295, y = 15, long = 20, larg = 20, action = function () btnOn = 1 end},--7

}
}

------FONCTION DRAW------
local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #quete.btn do
        if colisionPointRect(x, y, quete.btn[i].x, quete.btn[i].y, quete.btn[i].long, quete.btn[i].larg) then
            quete.btn[i].action()
        end
    end
end

-----DRAW----- : DESSINE CE QUE TU VOIS A L'ECRAN
quete.draw = function()


    love.graphics.draw(quete.img, quete.x, quete.y, 0, quete.long / quete.img:getWidth(), quete.larg /
    quete.img:getHeight(), 0, 0)

end

-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
quete.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end

return quete