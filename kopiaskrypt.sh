#!/bin/bash

if [ $UID -ne 0 ]
then
	echo "Musisz posiadać uprawnienia roota"
	exit 1
else
	echo "Podaj ścieżkę bezwzględną do pliku który chcesz zarchiwizować:"
	read path

	echo "Jaka ma mieć ono nazwę?"
	read nazwa

	echo "Czy archiwum ma być skompresowowane? y/n"
	read kompresja
fi

if [ -f $path ]
then
	echo "znaleziono plik! zaczynam prace"
	if [ $kompresja == "y" ]
	then
		tar -czvf $nazwa.tar.gz $path
		exit 69
	else
		tar -cvf $nazwa.tar $path
		exit 69
	fi
else
	echo "nie znaleziono pliku sprawdz jeszcze raz"
	exit 1
fi	
