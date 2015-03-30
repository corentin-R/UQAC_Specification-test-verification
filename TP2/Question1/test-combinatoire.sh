#!/bin/bash

bold=`tput bold`
normal=`tput sgr0`
	
echo -e ${bold}  "\e[94m"
echo "8INF958 - Spécification, test et vérification" ${normal}
echo -e "\e[94mEnseignant: Sylvain Hallé"
echo "TP2 Question1 : tests combinatoires"
echo "Corentin RAOULT, Arnaud BOURDA, Jérémy WURTZEL"
echo ${normal}
	
#questions
#regénération de tests pour couverture complète?
#sortie des commandes à enregister dans des fichiers?

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
	sed -n '/^ -/p' listeParametresTemp>listeParametres.txt

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
	sed -i '/^ -h/d' listeParametres.txt
	#add ":" after name of the parameter (3rd position) and create QICT test file
	sed 's/^\(.\{3\}\)/\1:/' listeParametres.txt>qictInputFile.txt
	#rm -h line
	sed -i '/^ -h/d' qictInputFile.txt
	#replace flag by true/false
	sed -i 's/flag/true, false/g' qictInputFile.txt
	#rm " -" (2 first char) at the begening of each line
	sed -i 's/^..//' qictInputFile.txt
}

modifInvalidComb()
{
	i=0
	#create boolean expression from invalids combinaisons
	while read -r line
	do
		#echo $line
		tabLine[$i]=$line
		let i++
	done < invalidCombinaisons.txt

	# get length of an array
	tLen=${#tabLine[@]}
	
	# use for loop read all lines
	for (( i=0; i<${tLen}; i++ ));
	do
		#echo  ${tabLine[$i]}
		#split string with "&"
		
		while IFS='&' read -ra ADDR; do

			for  (( j=0; j<${#ADDR[@]}; j++ ));  do

				a=( ${ADDR[j]} )						
						
				#add "= true" si nb of word == 1
				if (( ${#a[@]} == 1)); then
					ADDR[$j]=$(echo ${ADDR[j]} | sed  's/$/ = true /')
					a=( ${ADDR[j]} )
				fi

				if((j<${#ADDR[@]} - 1)); then
					echo -n "${a[@]}" "& " >> temp
				else
					echo "${a[@]}" >> temp
				fi
			done
			#echo combinaison "${ADDR[@]}"		
		done <<< "${tabLine[$i]}"
			
	done

	mv temp invalidCombinaisons.txt
}


generateTests()
{
	#use QICT
	./qict qictInputFile.txt -i invalidCombinaisons.txt 1>tests.txt
	#rm useless lines keep all Combinaisons
	sed -i -n '/Result test sets:/ { s///; :a; n; p; ba; }' tests.txt
	sed -i '/^$/d' tests.txt
	sed -i '/End/d' tests.txt
}


#vérifier combinaison
#remplacer en changean 1er param
#vérifier si ligne existe déjà dans tests.txt
#sinon on essaye avec autre param ou autre valeur

verifTests()
{
	i=0
	#create boolean expression from invalids combinaisons
	while read -r line
	do
		#echo $line
		tabLine[$i]=$line
		let i++
	done < invalidCombinaisons.txt

	# get length of an array
	tLen=${#tabLine[@]}

	# use for loop read all lines
	for (( i=0; i<${tLen}; i++ ));
	do
		#echo  ${tabLine[$i]}
	
			#split string with "&"
			while IFS='&' read -ra ADDR; do

				#looking for invalid combinaisons in tests.txt
				while read -r line  
				do 
					parametres=( $line )
					nb_occurence=0
					for  (( j=0; j<${#ADDR[@]}; j++ ));  do

						a=( ${ADDR[j]} )						
						
						#add "= true" si nb of word == 1
						if (( ${#a[@]} == 1)); then
							ADDR[$j]=$(echo ${ADDR[j]} | sed  's/$/ = true /')
							a=( ${ADDR[j]} )
						fi

						if [ "${a[0]}" != "[" ]; then
							ADDR[$j]=$(echo ${ADDR[$j]} | awk '{print "[ "$0" ]"}')
							ADDR[$j]=$(echo ${ADDR[$j]} | sed 's/=/==/')
							a=( ${ADDR[j]} )	
						fi			
						#echo "${a[@]}"

						#add brackets to value (3rd word)
						#ADDR[$j]=$(echo ${ADDR[j]} | sed 's/\(.*\)'${a[2]}'/\1"'${a[2]}'"/')
					
						#echo combinaison "${ADDR[$j]}"
						#replace parameter by tab
						num=$(grep -n ^"${a[1]}" qictInputFile.txt | cut -c1-1)
						#echo "${a[1]}" $num 
						res="${parametres[$num]}"
						ADDR[$j]=$(echo ${ADDR[j]} | sed '0,/'${a[1]}'/s//'$res'/')  #sed '0,/''/s// ''/')
	

						#${ADDR[j]} ; echo "-------------------------------------> $?"
						#echo ${ADDR[$j]} 
						if ${ADDR[$j]} ; then
							#echo "Invalid value"
							((nb_occurence++))						
						fi	
						ADDR[$j]="${a[@]}"
				done
				if (($nb_occurence == ${#ADDR[@]})); then
					#echo "Invalid Combinaison"
					#rm combinaison from file
					sed -i "/$line/d"  tests.txt	
				fi
			done < tests.txt	
			
		done <<< "${tabLine[$i]}"
	
	done
}


generateExe()
{
	cp tests.txt testsCommande.txt

	#rm num (4 first char) at the begening of each line
	sed -i 's/^....//' testsCommande.txt

	#put parameters in a array
	i=0
	while read -r line  
	do 
		long=$line
		tab[$i]=${long:0:2}
		#echo ${tab[i]}
		((i++)) 
		#sed -i 's/^\(.\{'$place'\}\)/\1'${long:0:2}'/' testsCommande.txt
	done < listeParametres.txt
	
	k=1 #nb of line
	while read -r line2  
	do 
		j=0 #nb of spaces
		i=0 #nb of char in line
		while  [ $i -lt ${#line2} ]
		do
			((i++))
			char=${line2:$i:1}
			#echo $char	
			if [[ "$char" == $'\t'  ]]; then
				((j++))		
				#add parameter with space around				
				line2="${line2:0:$i} ${tab[j]} ${line2:$((i+1))}"
			fi
		done
		sed -i "$k s/.*/${line2}/" testsCommande.txt
		((k++))
	done < testsCommande.txt

	# add 1st parameter at the beginning
	sed -i 's/^\(.\{0\}\)/\1 '${tab[0]}' /' testsCommande.txt
	# add exec path at the beginning
	sed -i 's/^/'$commande_string'/' testsCommande.txt

	removeTF

	#cat testsCommande.txt
	
}

removeTF()
{
	#clear temp file
	> testsCommande2.txt

	k=1 #nb of line
	while read -r line2  
	do 
		i=0
		a=( $line2 )
		while  [ $i -lt ${#a[@]} ]
		do			
			((i++))
			a=( $line2 )
			#echo ${a[i]} 
			if [[ "${a[i]}" == "false"  ]]; then
				#delete param before false
				line2=$(echo $line2 | sed 's/'${a[i-1]}'//g')		
			fi						
		done
		echo $line2 >> testsCommande2.txt
		((k++))
	done < testsCommande.txt

	# rm true
	sed -i 's/true//g' testsCommande2.txt
	# rm false
	sed -i 's/false//g'  testsCommande2.txt

	mv testsCommande2.txt testsCommande.txt

}

appelTests()
{
	bold=`tput bold`
	normal=`tput sgr0`
	
	#call each command line in testsCommande.txt
	while read -r line  
	do 
		echo -e ${bold} "\e[92m"	
		echo "-->" $line ${normal}
		$line
	done < testsCommande.txt
}

#-------MAIN-----------

rm *.txt

#split parameters' list and invalid combinaisons
initFiles

#take the parameters and create a file readable by QICT
generateQICT_inputFile

modifInvalidComb

#use QICT and clear the file to keep just the combinaisons
generateTests

#verif tests
#verifTests

#take the combinaisons an create executables commands with it
generateExe

#call each line of testsCommande.txt
appelTests
