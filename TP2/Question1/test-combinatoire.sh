#!/bin/bash

#exec prog & save stdout in file
/home/stev/tp2-app.sh -h 1>file

#keep all parameters
sed '/Invalid/q' file>listeParametresTemp

#remove useless lines from listeParametres
#keep all lines with "-" pattern
sed -n '/ -/p' listeParametresTemp>listeParametres

#keep all invalids Combinaisons
sed -n '/Invalid/ { s///; :a; n; p; ba; }' file>invalidCombinaisons

#remove useless lines from invalidCombinaisons
sed -i '/^$/d' invalidCombinaisons

#rm temp file
rm file
rm listeParametresTemp
