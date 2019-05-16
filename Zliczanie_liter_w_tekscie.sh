#!/bin/bash 
# $1 to argument zaierajacy plik z tesktem, $2 plik zawierajacy statystyke ilosci wystapien liter w tekscie
function zad(){
	if ! [[ -e $1 && -r $1 ]]; then
		exit 1
	fi
	if [[ -e $2 ]]; then 
		if ! [[ -w $2 ]]; then 
			exit 1
		fi
	else 
		echo "brak pliku" ##sprawdzanie czy mozna stworzyc plik
	fi
	declare -A tablica
	declare -a pozliczane
	tablica=([A]=0 [B]=0 [C]=0 [D]=0 [E]=0 [F]=0 
		[G]=0 [H]=0 [J]=0 [K]=0 )

	for literka in ${!tablica[@]}; do
		tablica[$literka]=`cat $1 | tr '[a-z]' '[A-Z]' | grep -oP [$literka]  | wc -l`
		#echo $literka - ${tablica[$literka]}
		pozliczane+=( "$literka - ${tablica[$literka]}" )
	done 
	sort -r -k3 -n <<<"$(printf "%s\n" "${pozliczane[@]}")" > $2

}

zad $1 $2
