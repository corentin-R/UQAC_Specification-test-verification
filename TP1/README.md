#TP1

Répondez aux questions suivantes, en équipes d'une à trois personnes, et remettez votre travail selon les modalités décrites en fin de document avant le 2 mars 2015.

##Partie 1: analyse de logs

Sur le serveur du cours, dans le dossier /home/stev/TP1, se trouve un fichier log de grande taille appelé Log.xml. Ce log relève les actions effectuées par les utilisateurs (fictifs) d'un système. Consultez les premières lignes de ce fichier pour en comprendre le format assez intuitif.

Dans le langage de votre choix (présent sur le serveur du cours), écrivez un programme qui répond aux questions suivantes:

    Y a-t-il une session qui dure plus d'une heure? (Une session étant ouverte au moyen d'un "login" et fermée au moyen d'un "logout" pour un même utilisateur.)
    Quel est le nom des fichiers dans lesquels on a essayé d'écrire avant de les avoir ouverts (attention: un même fichier peut avoir été ouvert/fermé plusieurs fois, et par plusieurs utilisateurs)?
    Quel est le nom de toutes les applications ayant été utilisées simultanément par au moins deux utilisateurs (i.e. ouvertes par au moins deux utilisateurs dans des sessions parallèles)?
    Quelles sont les extrémités de chaque "ligne"? Une ligne est un patron de trois clics successifs effectués par l'utilisateur dans la même application, et dont les coordonnées x-y se situent sur une même droite.
    Y a-t-il eu des attaques de force brute en ligne contre le système d'authentification? Pour les besoins du travail, une attaque de force brute survient lorsqu'un utilisateur échoue son login plus de trois fois dans la même minute. Pour chaque attaque, on doit retourner le nom de l'utilisateur et l'heure du premier login échoué.

Le programme peut être implémenté de n'importe quelle manière, mais doit chercher à analyser le log le plus rapidement possible.

Peu importe la solution choisie, on doit pouvoir lancer le code répondant à chaque question x par un script Bash appelé question-x.sh.

##Partie 2: duels de code

Le site Pex for Fun propose de résoudre des "duels de code" (coding duels). Un duel est un puzzle interactif où votre tâche consiste à implémenter une méthode (appelée Puzzle) de manière à ce qu'elle se comporte exactement comme une autre méthode qui vous est inconnue. Vous cliquez sur le bouton "Ask Pex!" pour vérifier si la méthode que vous proposez fait la même chose que la méthode secrète; l'outil en ligne Pex vous retourne les différences relevées, le cas échéant. Vous gagnez le duel lorsque Pex ne parvient plus à trouver aucune différence.

Résolvez avec succès les duels suivants:

    Puzzle 1
    Puzzle 2
    Puzzle 3

Lorsque vous gagnez un duel, Pex vous retourne son winning number, qui est un série de neuf chiffres. Vous devez donc fournir les chiffres pour chacun des duels précédents.
