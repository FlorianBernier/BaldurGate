local inventaire = {
    r = 0.2,
    g = 1,
    b =0.5,
    x = 150, 
    y = 10, 
    long = 500,
    larg = 580,
    img = love.graphics.newImage("imgSoa/menuInventaire.png"),

}

inventaire.draw = function()
    love.graphics.draw(inventaire.img, inventaire.x, inventaire.y, 0, inventaire.long / inventaire.img:getWidth(), inventaire.larg /
    inventaire.img:getHeight(), 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Inventaires", 367, 26)
    love.graphics.print("Perso", 245, 57)
    love.graphics.print("Classe", 367, 57)
    love.graphics.print("Projectiles", 210, 94)
    love.graphics.print("Armes rapides", 183, 177)
    love.graphics.print("Objets rapides", 175, 265)


end

inventaire.mousepressed = function(x, y)
end

return inventaire