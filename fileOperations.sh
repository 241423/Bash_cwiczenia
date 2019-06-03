#!/bin/bash
#zadanie 1
function zad1(){
	if ! [[ -r $1 ]]; then
		echo "nie ma prawa do oczytu"
		exit -1
	fi
	if ! [[ -e $2 ]]; then
		echo "ni ma pliku"
		touch $2
	fi
	if ! [[ -e $3 ]]; then
		touch $3
	fi
	if ! [[ -w $2 ]]; then 
		echo "ni dopisze wiec se nadam prawa"
		chmod +w $2
	fi
	if ! [[ -w $3 ]]; then
		chmod +w $3
	fi
	if ! [[ -s $2 ]]; then
		echo "nie istnial albo nie byl pusty" > $2
	fi
	if [[ -s $3 ]]; then
		echo "" > $3
	fi
	tmpFile=$(mktemp)
	nl $1 > tmpFile
	cat tmpFile
	awk 'NR%2==0' tmpFile > $2
	awk 'NR%2==1' tmpFile > $3
	rm tmpFile
}

zad1 $1 $2 $3
#zadanie 2
function zad2(){
	if [[ ! -d $1 ]]; then
		echo $1
		mkdir $1
	fi
	if ! [[ -w $1 ]]; then 
		echo "nie mozna zapisac"
		exit 1
	fi
	sciezka_katalogu=$(grep -P 'D:/' $2 | cut -c 3-) 
	#sciezka_pliku=$(grep -P 'F:/' $2 | cut -c 3-)
	katalogi=$(mktemp)
	pliki=$(mktemp)
	#grep -P 'D:/' $2 | cut -c 3- > katalogi 
	grep -P 'F:/' $2 | cut -c 3- > pliki
	#cat katalogi 
	mkdir $sciezka_katalogu
	if [[ ! -e sciezka_pliku ]]; then
		echo "ni ma "
	fi
	echo $sciezka_katalogu


}
echo $4
zad2 $4 $5

#zadanie 3

function zad1(){
	if ! [[ -r $1 ]]; then
		echo "brak mozliwosci odczytu"
		exit -1
	fi
	if ! [[ -f $2 ]]; then
		touch $2
	elif ! [[ -w $2 ]]; then 
		chmod +w $2
	fi
	if ! [[ -f $3 ]]; then
		touch $3
	elif ! [[ -w $3 ]]; then
		chmod +w $3
	fi
	if [[ -f $2 ]]; then
		echo "" > $2
	fi
	if [[ -f $3 ]]; then
		echo "" > $3
	fi
	tymczasowy="$1"
	while IFS= read -r linia;	do
  	liczba=$(( ( RANDOM % 2 )  + 1 ))
  	if [[ liczba -eq 1 ]]; then
	  	echo $linia >> $2
	else
		echo $linia >> $3 
	fi
	done < "$tymczasowy"
}

zad1 $1 $2 $3

#zadanie 4
echo "zad8.1"
function zad2(){
	if ! [[ -d $1 ]]; then 
		echo "zla sciezka"
		exit -1
	fi
	if ! [[ -w $1 ]]; then
		echo "brak prawa zapisu"
		exit -1
	fi
	if ! [[ -r $2 ]]; then 
		" brak prawa odczytu"
		exit -1
	fi
	tymczasowy="$2"
	while IFS= read -r linia; do
  		mkdir $linia
  		cd $linia
  		touch F0 F1 F2 F3 F4 F5 F6 F7 F8 F9
  		cd ..
	done < "$tymczasowy"

}

zad2 $4 $5

#• Ścieżka do pliku źródłowego znajduje się w pierwszym argumencie.
#• Scieżki do plików wyjściowych znajdują się w kolejnych argumentach.
#• Dla każdej linii pliku wejściowego należy podjąć decyzję czy trafi do pierwszego czy do drugiego
#pliku wyjściowego.
#– Linie o numerach parzystych trafią do pliku wskazywanego przez $1.
#– Linie o numerach nieparzystych trafią do pliku wskazywanego przez $2.
#– Każdą z linii w plikach wyjściowych powinien poprzedzać jej numer w oryginalnym pliku.
#• sprawdź czy masz prawo do odczytania pliku źródłowego. Jeśli nie wyświetl komunikat błędu
#na standardowy strumień błędów oraz zakończ działanie funkcji z kodem błędu -1 (polecenie
#exit).
#• Sprawdź czy pliki docelowe istnieją. Jeżeli nie stwórz je. Jeżeli tak sprawdź czy masz upraw-
#nienia pozwalające na zapisanie danych do tych plików.
#• Jeśli pliki istnieją wyczyść ich zawartość.

#Zadanie 2
#Utwórz funkcję, która w zadanym katalogu stworzy strukturę podkatalogów i plików
#• Pierwszy argument zawiera ścieżkę do katalogu, w którym będziemy tworzyć kolejne katalogi.
#– Sprawdź czy ścieżka faktycznie wskazuje na katalog. Jeśli nie wypisz komunikat do stru-
#mienia błędów i przerwij wykonanie funkcji.
#– Sprawdź czy masz prawa do zapisywania do katalogu. Jeśli nie wypisz komunikat do
#strumienia błędów i przerwij wykonanie funkcji.
#• Drugi argument przechowuje plik, który przechowuje listę katalogów/plików do utworzenia.
#Dane przechowywane są w następujacym formacie:
#– D:/path/to/directory – wskazuje na ścieżkę do katalogu
#– F:/path/to/file – wskazuje na ścieżkę do pliku (nie ma gwarancji, że katalogi, w których
#znajduje się plik istnieją)
#1– Plik zawiera jedną ścieżkę w jednej linii. Przyjmij, że podane nazwy są prawidłowymi
#nazwami dla katalogów i plików.
#– Przyjmij, że podane ścieżki nie zawierają znaku ’:’.
#– Jeśli prefiks linii jest inny niż ’D’ lub ’F’, to zignoruj linię
#– Sprawdź czy masz uprawnienia do odczytywania pliku. Jeśli nie wypisz komunikat do
#strumienia błędów i przerwij wykonanie funkcji.
#– Jeśli plik (do którego ścieżka jest podana w pliku) istnieje, to nie twórz pliku.

#zadanie 3
#Utwórz funkcję, która losowo rozdzieli linie oryginalnego pliku do dwóch plików wyjściowych
#• Ścieżka do pliku źródłowego znajduje się w pierwszym argumencie.
#• Scieżki do plików wyjściowych znajdują się w kolejnych argumentach.
#• Dla każdej linii pliku wejściowego należy podjąć decyzję czy trafi do pierwszego czy do drugiego
#pliku wyjściowego. Do wygenerowania liczb losowych użyj zmiennej RANDOM.
#• sprawdź czy masz prawo do odczytania pliku źródłowego. Jeśli nie wyświetl komunikat błędu
#na standardowy strumień błędów oraz zakończ działanie funkcji z kodem błędu -1 (polecenie
#exit).
#• Sprawdź czy pliki docelowe istnieją. Jeżeli nie stwórz je. Jeżeli tak sprawdź czy masz upraw-
#nienia pozwalające na zapisanie danych do tych plików.
#• Jeśli pliki istnieją wyczyść ich zawartość.


#Zadanie 4
#Utwórz funkcję, która w zadanym katalogu stworzy strukturę podkatalogów i plików
#• Pierwszy argument zawiera ścieżkę do katalogu, w którym będziemy tworzyć kolejne katalogi.
#– Sprawdź czy ścieżka faktycznie wskazuje na katalog. Jeśli nie wypisz komunikat do stru-
#mienia błędów i przerwij wykonanie funkcji.
#– Sprawdź czy masz prawa do zapisywania do katalogu. Jeśli nie wypisz komunikat do
#strumienia błędów i przerwij wykonanie funkcji.
#• Drugi argument przechowuje plik, który przechowuje listę katalogów do utworzenia.
#– Sprawdź czy masz uprawnienia do odczytywania pliku. Jeśli nie wypisz komunikat do
#strumienia błędów i przerwij wykonanie funkcji.
#– Plik zawiera jedną nazwę katalogu w jednej linii. Przyjmij, że podane nazwy są prawi-
#dłowymi nazwami dla katalogów (nie zawierają niedozwolonych znaków)
#• W każdym z utworzonych podkatalogów utwórz 10 plików nazwanych F0, F1,F2,· · · ,F9#,
