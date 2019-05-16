#!/bin/bash
#Zadanie 1
#Oblicza rownanie ($1+$2)/($1-$2)
echo "Zadanie 1"
function zad1(){
	if [[ $1+$2 -eq 0 ]]; then
		echo "mianownik rowny 0"
		exit -1
	else
		echo $(( ($1+$2)/($1-$2) )) 
	fi
}
zad1 $1 $2

#Zadanie 2 
#Ciag fibbonaciego rekurencyjnie 
echo "Zadanie 2"
function zad2(){
	if [[ ${#} -ne 1 ]]; then 
		echo "Zla liczba argumentow"
		exit -1
	else 
		if [[ $1 -eq 1 || $1 -eq 2 ]]; then 
			echo 1
		else
		 	echo $(( $(zad2 $(($1-1)) ) + $(zad2 $(($1-2)) ) ))
		fi 
	fi
}

zad2 8

#Zadanie 3
#Ciag fibbonaciego iteracyjnie
echo "Zadanie 3"
function zad3(){
	if [[ ${#} -ne 1 ]]; then
		echo "Zla liczba argumentow"
		exit -1 
	else
		a=1
		b=1
		echo $a 
		echo $b
		for (( i=0; i<$1-2; i++)); do
			fn=$(($a+$b))
			echo $fn
			a=$b
			b=$fn

		done
	fi
}

zad3 8 

#Zadanie 4
#Znajdowanie maximum 

echo "zadanie 4"

function zad4(){
	tablica=("$@") 
	max="${tablica[0]}"
	for liczba in "${tablica[@]}"; do
		if [[ bc <<< "liczba -gt max" ]]; then
			max="${liczba}"
	    fi	     
	done
	echo "${max}"
}

a=(1 5.5 2) 
zad4 "${a[@]}"

#zadanie 5
#silnia rekurencyjnie
echo "Zadanie 6.1"
function zad2(){
	if [[ "${#}" -ne 1  ]]; then
	 	echo "zla liczba argumentow "
	 	exit -1
	elif [[ $1 -lt 0 ]]; then 
		echo "argument nie moze byc mniejszy niz 0"
	else 
		if [[ $1 -eq 1 || $1 -eq 0 ]]; then
			echo 1
		else 
			echo $(( $1 * $(zad2 $(( $1-1 )) ) ))
		fi
	fi

}
zad2 5

#zadanie 6 
#silnia iteracyjnie
echo "Zadanie 6.2"
function zad3(){
	if [[ ${#} -ne 1 ]]; then 
		echo "Zla liczba argumentow"
		exit -1
	else 
		silnia=1
		for (( i=1; i<=$1; i++ )); do
			silnia=$(($silnia*$i))
		done  
		echo $silnia
	fi

}
zad3 5

#zadanie7
#suma przekazanych argumentow
echo "Zadanie 6.3"
function zad4(){
	tablica=("$@")
	suma=0
	for element in "${tablica[@]}"; do
		suma=$(( $suma + element ))
	done 
	echo ${suma} 
}

a=(1 4 3 5 2)
zad4 "${a[@]}"





