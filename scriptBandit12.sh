#!/bin/bash

# El siguiente script nos permite automatizar el proceso de descompresión del archivo data del nivel Bandit 12.
# En primer lugar debemos de deshacer el volcado en hexadecimal y guardar los resultados en un archivo
# gunzip (data.gz por ejemplo). Para crear el archivo podemos utilizar el siguiente comando.
# cat data | xxd -r | sponge data.gz 
# Luego utilizando un bucle while y con el comando 7z descomprimiremos el archivo de forma recursiva.

cat data | xxd -r | sponge data.gz

function ctrl_c(){
    echo -e "\n\n [!] Saliendo... \n"
    exit 1
}

# Ctrl+C
trap ctrl_c INT
 
first_file_name="data.gz"
decompressed_file_name="$(7z l data.gz | tail -n 3 | head -n 1 | xargs | awk 'NF{print $NF}')"

7z x $first_file_name &>/dev/null

while [ $decompressed_file_name ]; do 
     echo -e "\n [+] Nuevo archivo descomprimido: $decompressed_file_name"
     7z x $decompressed_file_name &>/dev/null 
     decompressed_file_name="$(7z l $decompressed_file_name 2>/dev/null | tail -n 3 | head -n 1 | xargs | awk 'NF{print $NF}')"
done
