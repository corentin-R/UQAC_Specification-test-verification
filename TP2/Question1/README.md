#Partie 1: tests combinatoires

L'outil permet de récupérer la sortie standard d'une application avec l'option '-h' ou '--help', par exemple:

```bash
$ /home/stev/tp2-app.sh -h
```

…l'application retourne sur la sortie standard (stdout) la liste de tous les arguments qui peuvent être utilisés lorsqu'on invoque l'application, ainsi que leurs valeurs possibles. On obtient quelque chose qui ressemble à ceci:

```bash
Usage: tp2-app.sh [options] argument

Options:
-f      0, 1, 2, 3
-j      abc, def, ghi
-p      flag
…
Invalid combinations:
 p & j = abc
 …
```

On a ainsi la liste des paramètres en ligne de commande et leurs valeurs possibles; le mot "flag" indique que le paramètre est un booléen, i.e. il est soit présent, soit absent. Sauf s'il s'agit de booléens, chaque paramètre doit figurer dans un appel au programme (à l'exception de '-h' qui ne sert qu'à afficher les valeurs des autres paramètres).

Ensuite, on a une liste de combinaisons interdites: chaque ligne donne une condition sur les valeurs de certaines options qui ne doivent pas être appelées. Dans l'exemple ci-dessus, on dit donc qu'on ne peut en même temps avoir le paramètre -p à la ligne de commande et le paramètre j à la valeur "abc". Chaque ligne est formée de conjonctions (i.e. conditions élémentaires séparées par des "&") et le seul opérateur permis est l'égalité.

Dans l'exemple précédent, un appel valide au programme serait donc:

```bash
tp2-app.sh -f 0 -p -j ghi
```

Le programme récupère de façon dynamique la liste des paramètres et des valeurs possibles de l'application, ainsi que les combinaisons interdites.
Il appelle ensuite l'application à répétition, de manière à couvrir toutes les valeurs possibles pour chaque paire de paramètres (i.e. "2-way"), tout en respectant les combinaisons invalides.

L'outil développé est écrit en BASH et utilise une version modifiée de QICT qui permet de prendre en compte des contraintes (c.à.d les combinaisons interdites) un peu à la manière de PICT mais en moins puissant.

