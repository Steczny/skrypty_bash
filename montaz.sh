#!/usr/bin/bash
#autor Radosław "Steczny" Pędziwilk
#Licencja rob co chcesz tylko wskaz autora oryginału ;)

#sprawdzamy czy uzytkownik ma uprawnienia roota
if [ "$UID" -ne 0 ]
then
    echo "Nie masz uprawnien roota, zmien konto za pomocą sudo su lub użyj sudo!"
    exit 1
fi

#pytanie o nazwe urzadzenia
echo "Podaj mi nazwe urządzenia które chcesz zamontować (np. sda1)  sprawdz przy pomocy lsblk!"
read -r nazwa_urzadzenia

#sprawdzanie czy urzadzenie isntieje
if [ ! -e "/dev/$nazwa_urzadzenia" ]
then
    echo "nie wykryto urzadzenia!"
    exit 2
fi

#pytanie o sciescie do montowania
echo "Podaj ścieżkę do montażu urządzenia: "
read -r path

#sprawdzenie czy punkt montowania istnieje
if [ ! -d "$path" ]
then
    echo "Punkt montazu nie istnieje. Tworze katalog: $path"
    mkdir -p "$path"
fi

#montowanie urzadzenia
echo "Montowanie /dev/$nazwa_urzadzenia w $path..."
if mount "/dev/$nazwa_urzadzenia" "$path"
then
    echo "Urządzenie zostało pomyślnie zamontowane w $path"
else
    echo "Błąd podczas montowania urządzenia!"
    exit 3
fi
