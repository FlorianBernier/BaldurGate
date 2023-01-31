local stat = {
    r = 0.4,
    g = 1,
    b =0.5,
    x = 150,
    y = 10,
    long = 500,
    larg = 580,
    img = love.graphics.newImage("imgSoa/menuStat.png"),
    img2 = love.graphics.newImage("imgSoa/iconePerso1.png"),
}

stat.draw = function()
    love.graphics.draw(stat.img, stat.x, stat.y, 0, stat.long / stat.img:getWidth(), stat.larg /
    stat.img:getHeight(), 0, 0)
    love.graphics.draw(stat.img2, 507, 129, 0, 88 / stat.img:getWidth(), 107 /
    stat.img:getHeight(), 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Perso", 380, 28)
    love.graphics.print("INFOS", 217, 65)
    love.graphics.print("CLASSE", 293, 65)
    love.graphics.print("STATS \nCOMBAT", 378, 58)
    love.graphics.print("TALENTS", 450, 65)
    love.graphics.print("CAPACITES", 525, 65)
    love.graphics.print("STATS", 207, 125)
    love.graphics.print("BIOGRAPHIE", 290, 125)
    love.graphics.print("CLASSES \nJUMELEES", 408, 318)
    love.graphics.print("NIVEAU \nSUPERIEUR", 408, 357)
    love.graphics.print("PERSONNALISER", 210, 538)
    love.graphics.print("MODIFIER GROUPE", 345, 538)
    love.graphics.print("EXPORTER", 505, 538)





end

stat.mousepressed = function(x, y)
end

return stat