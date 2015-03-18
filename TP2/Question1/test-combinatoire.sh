#!/bin/bash

#TP2 Question1 -> tests combinatoires
#Corentin RAOULT, Arnaud BOURDA, Jérémy WURTZEL

#questions
#utilisation de -h?
#regénération de tests pour couverture complète?
#toujours " -" au début de chaque ligne? (pas de tab ou rien avant "-")? et "Invalid" et "usage" 
#paramètres de plusieurs caractères?

#cstes
commande="/home/stev/tp2-app.sh"
commande_string="\/home\/stev\/tp2-app.sh"

initFiles()
{
	#exec prog & save stdout in file
	$commande -h 1>file

	#keep all parameters
	sed '/Invalid/q' file>listeParametresTemp

	#remove useless lines from listeParametres
	#keep all lines with "-" pattern
	sed -n '/ -/p' listeParametresTemp>listeParametres.txt

	#keep all invalids Combinaisons
	sed -n '/Invalid/ { s///; :a; n; p; ba; }' file>invalidCombinaisons.txt

	#remove useless lines from invalidCombinaisons
	sed -i '/^$/d' invalidCombinaisons.txt

	#rm temp file
	rm file
	rm listeParametresTemp
}

generateQICT_inputFile()
{
	#add ":" after name of the parameter (3rd position) and create QICT test file
	sed 's/^\(.\{3\}\)/\1:/' listeParametres.txt>qictInputFile.txt
	#rm -h line
	#sed -i '/-h/d' qict-file.txt
	#replace flag by true/false
	sed -i 's/flag/true, false/g' qictInputFile.txt
	#rm " -" (2 first char) at the begening of each line
	sed -i 's/^..//' qictInputFile.txt
}

generateTests()
{
	#use QICT
	qict qictInputFile.txt 1>tests.txt
	#rm useless lines keep all Combinaisons
	sed -i -n '/Result test sets:/ { s///; :a; n; p; ba; }' tests.txt
	sed -i '/^$/d' tests.txt
	sed -i '/End/d' tests.txt
}

appelTests()
{
	cp tests.txt testsCommande.txt

	sed -i 's/^\(.\{4\}\)/\1-a /' testsCommande.txt
	sed -i 's/^.../'$commande_string'/' testsCommande.txt

	i=0
	while read -r line  
	do 
		long=$line
		tab[$i]=${long:0:2}
		echo ${tab[i]}
		((i++)) 
	done < listeParametres.txt


	
}

initFiles

generateQICT_inputFile

generateTests

appelTests
