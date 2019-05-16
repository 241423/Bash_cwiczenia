#!/bin/bash
#Zadanie 1 
#sortowanie przez podstawianie
function zad1(){
	tablica=("$@") 
	n=${#tablica[*]}
	for (( i=1;i<$n;i++)); do
		j=$i-1
		tymczasowe=${tablica[$i]}

		while (( $j>=0 && $(echo "${tablica[j]} > ${tymczasowe}" |bc -l) )); do
			tablica[$j+1]=${tablica[$j]}
			j=$j-1
		done
		tablica[j+1]=${tymczasowe}
	done
	echo ${tablica[*]}
}

a=(5 3 2 4 8 1)
zad1 5.6 3 2.4 2.3 4 8 1
#zad1 "${a[@]}"

#Zadanie 2 
#dwuwymiarowa tablica uzupelniona losowymi liczbami
function zad2(){
	#wiersze $1
	#kolumny $2
	sprawdz='^[0-9]+$'
declare -A tablica
if ! [[ $1 =~ $sprawdz ]];then
	echo "zle podana liczba kolumn lub wierszy"
	exit -1
elif [[ $1 -le 0 && $2 -le 0 ]]; then
	echo "zle podana liczba kolumn lub wierszy"
	exit -1 
else
	for (( i=1; i<=$1; i++ )); do
		for (( j=1; j<=$2; j++ )); do
			liczba=${RANDOM}
			tablica[$i,$j]=$(( $liczba%21 ))
		done	
	done
fi
echo "tablica:"
for (( i=1; i<=$1; i++ )); do
	for (( j=1; j<=$2; j++ )); do
			printf ${tablica[$i,$j]}
			printf " "
	done
	echo	
done
}

zad2 $1 $2


function zad3(){
	tablica=("$@")
	n=${#tablica[*]}
	for ((i = 0; i<n; i++)); do
      
    	for((j = i; j<n-i-1; j++)); do
      
        	if (( $(echo "${tablica[j]} > ${tablica[$j+1]}" |bc -l) )); then
            # swap 
            tymczasowe=${tablica[$j]} 
            tablica[$j]=${tablica[$j+1]}   
            tablica[$j+1]=$tymczasowe 
        fi
    done
done

echo ${tablica[*]} 
}

zad3 4.5 3.2 5.6
