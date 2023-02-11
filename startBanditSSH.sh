#!/bin/bash

# SINTAXIS: ./script.sh [Level Number] [Password]
# Este escript te conectara con el nivel siguiente de OverTheWire y creará un arhivo donde guardará
# la contraseña por si queremos volver a conectarnos en un futuro.


#Colour
greenColour="\e[0;32m\033[1m"

level=$1
pass=$2

echo -e "\n ${greenColour}[+] Over The Wire: Bandit${endColour}"
echo -e "\n ${greenColour}[+] Nivel: $1 ${endColour}"

echo $2 > pass$1.txt

ssh bandit$1@bandit.labs.overthewire.org -p 2220
