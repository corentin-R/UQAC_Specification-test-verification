#Partie 2: tests sur interface graphique.

##Selenium WebDriver

Automatisation des tests de régression dans la plateforme Moodle de l'UQAC. Le logiciel Selenium WebDriver permet d'automatiser l'interaction avec une site web dans un navigateur. Au moyens de scripts écrits en Java, il est possible d'obtenir une référence à des éléments dans une page pour interroger leur état (position, taille, texte, etc.), provoquer un clic ou écrire du texte dans un formulaire.

Les scripts ouvrent moodle dans le navigateur par défaut et mettent en évidence le bug en question. Le résultat s'affiche aussi dans le terminal.

Ci-dessous les liens vers les bugs associés à chaque script et rapportés dans le bug tracker de Moodle.

bug-1.sh : [bug-33886](https://tracker.moodle.org/browse/MDL-33886)(Adding a really long file name as the filename of a backup is not handled by Moodle)

bug-2.sh : [bug-36543](https://tracker.moodle.org/browse/MDL-36543) (Navigation block mixes clickable parents and semantic parents in the same block)
