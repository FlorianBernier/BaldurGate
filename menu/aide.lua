local btnOnAide = 9

local btnRetour = 0

local aide = {
    r = 0.5,
    g = 0.2,
    b =0.8,
    x = 200,
    y = 200,
    long = 400,
    larg = 200,
    img = love.graphics.newImage("imgSoa/menuAide.png"),
    btn = {
        --RETOUR JEU --1--
        {x = 35, y = 19, long = 70, larg = 19, action = function () btnOnAide = 1 end, nom = "Retour jeu", 
        texte = "Le bouton Retour jeu vous renvoie sur l'écrant \nprincipal du jeu."},
        --CARTE --2--
        {x = 35, y = 59, long = 70, larg = 19, action = function () btnOnAide = 2 end, nom = "Carte",
         texte = "Le bouton Carte fait apparaitre la carte de la \nzone en cours. A partir de l'écrant Carte, vous pouvez \naussi voir la carte du monde. \n\nRemarque : pour voyager d'une zone a une autre, \ndéplacer votre groupe jusqu'a la sortie de la zone."},
        --QUETE --3--
        {x = 35, y = 99, long = 70, larg = 19, action = function () btnOnAide = 3 end, nom = "Quete",
         texte = "Le bouton Quete fait apparaitre les entrées de \nquete et les quetes qui on été ajoutées."},
        --INVENTAIRE --4--
        {x = 35, y = 139, long = 70, larg = 19, action = function () btnOnAide = 4 end, nom = "Inventaire",
         texte = "Le bouton Inventaire fait apparaitre l'inventaire \ndu personnage sélectioner. A partir de cet écrant vous \npouvez gérer les objets de son sac a dos ainsi que son \néquipement. \nRemarque : si aucun personnage n'est sélectionné, \nl'inventaire du chef du groupe sera affiché."},
        --STAT --5--
        {x = 35, y = 179, long = 70, larg = 19, action = function () btnOnAide = 5 end, nom = "Stat",
         texte = "Le bouton Stat fait apparaitre l'écrant des scores, \nde caractéristique, des capacités de classe, TACO et \nautres informations. Depuis cet écrant vous pouvez \naugmanter le niveau d'un personnage si il a obtenue \nsufisament d'expériance."},
        --SORT PROFANE --6--
        {x = 35, y = 219, long = 70, larg = 38, action = function () btnOnAide = 6 end, nom = "Sort \nprofane",
         texte = "Le bouton Sort profane fait apparaitre le livre de \nsorts du personnage sélectionné, qui affiche tous les \nsorts de magicien connus par le personnage et vous \npermet de choisir les quels mémoriser. \nRemarque : ces sorts ne seront disponibles pour le \nlancer qu'après un repos."},
        --SORT DIVIN --7--
        {x = 35, y = 259, long = 70, larg = 19, action = function () btnOnAide = 7 end, nom = "Sort divin",
         texte = "Le bouton Sort profane fait apparaitre le livre de \nsorts du personnage sélectionné, qui affiche tous les \nsorts de magicien connus par le personnage et vous \npermet de choisir les quels mémoriser. \nRemarque : ces sorts ne seront disponibles pour le \nlancer qu'après un repos."},
        --OPTION --8--
        {x = 35, y = 299, long = 70, larg = 19, action = function () btnOnAide = 8 end, nom = "option",
         texte = "Le bouton Option fait apparaitre l'écrant Options, qui \nvous permet de sauvegarder votre partie, charger une \nprécédente sauvegarde, quitter le jeu ou modifier les \noptions du jeu, des sons ou des graphismes."},
        --AIDE --9--
        {x = 35, y = 399, long = 70, larg = 19, action = function () btnOnAide = 9 end, nom = "Aide",
         texte = "Le boutton Aide surligne les autres bouttons \nde l'écrant principal du jeu. Sélectionnez alors n'importe \nlequel des bouttons surlignées pour obtenir des \ninformations sur sa fonction."},
        --SAUVEGARDE --10--
        {x = 35, y = 439, long = 70, larg = 19, action = function () btnOnAide = 10 end, nom = "Sauvegarde",
         texte = "Le bouton Sauvegarde crée une sauvegarde \nautomatiquement nommée 'Sauvegarde-Rapide'. \n\nRemarque : ces sauvegardes peuvent être écrasés par \nde futures sauvegardes rapides."},
        --REPOS --11--
        {x = 35, y = 479, long = 70, larg = 19, action = function () btnOnAide = 11 end, nom = "Repos",
         texte = "Le bouton Repos permet de soigner vos personnages, \nde récupérer leurs sorts mémorisés. \n\nRemarque : le temps du jeu avance de 12 heures."},
        --PAUSE --12--
        {x = 35, y = 539, long = 70, larg = 19, action = function () btnOnAide = 12 end, nom = "Pause",
         texte = "Vous pouvez mettre le jeu en pause a tout moment. \nC'est un élément très important du système de jeu car \nle combat vas souvent devenir ingérables en temps \nréel."},

        --PERSO --13--
        {x = 730, y = 19, long = 35, larg = 19, action = function () btnOnAide = 13 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PERSO --14--
        {x = 730, y = 79, long = 35, larg = 19, action = function () btnOnAide = 14 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PERSO --15--
        {x = 730, y = 139, long = 35, larg = 19, action = function () btnOnAide = 15 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PERSO --16--
        {x = 730, y = 199, long = 35, larg = 19, action = function () btnOnAide = 16 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PERSO --17--
        {x = 730, y = 259, long = 35, larg = 19, action = function () btnOnAide = 17 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PERSO --18--
        {x = 730, y = 319, long = 35, larg = 19, action = function () btnOnAide = 18 end, nom = "Perso",
         texte = "Le portrait des personnages peut servir a sélectionner \nou a cibler un membre du groupe. Les dégats sont \naffichés sous forme d'une barre rouge qui recouvre \nprogressivement les portraits. Les icone qui \napparaissent pour montrer les effets d'états sont \ndécrite dans les stats."},
        --PASS --19--
        {x = 730, y = 419, long = 35, larg = 19, action = function () btnOnAide = 19 end, nom = "Pass",
         texte = "Ce bouton n'es pas encore définis"},
        --DETAIL --20--
        {x = 730, y = 459, long = 35, larg = 19, action = function () btnOnAide = 20 end, nom = "détail",
         texte = "Le bouton détail surligne tous les objets a l'écran qui \npeuvent être manipulés, comme les coffres, les \nportes ou les objets au sol. Le total de point de vie \ndes membres de votre groupe est aussi affiché \nau-dessus de leur tete"},
        --IA GRP --21--
        {x = 730, y = 499, long = 35, larg = 19, action = function () btnOnAide = 21 end, nom = "IA grp",
         texte = "Le bouton IA groupe change le fait que les membres du \ngroupe vont ce comporter, ou non, selon le script \nchoisi pour eux. "},
        --SELECT PERSO --22--
        {x = 730, y = 539, long = 35, larg = 38, action = function () btnOnAide = 22 end, nom = "Sélect \nperso",
         texte = "Le bouton Sélectionner personnage sélectionne tout les \nmembre du groupe. Sélectionner le bouton deux fois \nrapidement fait centrer la vue sur le chef du groupe"},
        --TERMINER --23--
        {x = 337, y = 340, long = 131, larg = 35, action = function () btnOn = btnRetour end, texte = " "},
        
    }
}

------FONCTION DRAW------
local function drawContourBtnJeuOn()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("line", aide.btn[btnOnAide].x, aide.btn[btnOnAide].y, aide.btn[btnOnAide].long, aide.btn[btnOnAide].larg)
end

local function colisionSourisBtn(x, y)
    --colision de la souris avec un btnJeu
    for i = 1, #aide.btn do
        if colisionPointRect(x, y, aide.btn[i].x, aide.btn[i].y, aide.btn[i].long, aide.btn[i].larg) then
            aide.btn[i].action()
        end
    end
end

aide.draw = function()
    

    love.graphics.draw(aide.img, aide.x, aide.y, 0, aide.long / aide.img:getWidth(), aide.larg /
    aide.img:getHeight(), 0, 0)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("TERMINER", 370, 352)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(aide.btn[btnOnAide].texte, 260, 220)

    for i = 1, #aide.btn -1 do
        love.graphics.setColor(1, 1, 1)
        if i == btnOnAide then
            love.graphics.setColor(1, 1, 1,0)
        end
        love.graphics.print(aide.btn[i].nom, aide.btn[i].x, aide.btn[i].y)

    end

    --drawContourBtnJeuOn()
end

-----MOUSEPRESSED--------- : ACTION DU JOUEUR SOURIS
aide.mousepressed = function(x, y)
    colisionSourisBtn(x, y)
end


aide.setBtnRetour= function(btn) 
    btnRetour = btn
end

return aide