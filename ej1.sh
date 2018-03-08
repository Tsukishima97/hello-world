#!/bin/bash
carpeta=$1 #cogemos el argumento que contiene la carpeta
echo "El nombre del directorio es: "$carpeta

if [ -e ordenacion.txt ]
then
	rm -rf ordenacion.txt
else
	touch ordenacion.txt
fi

fichc=$(find $carpeta -type f -name "*.c" | wc -l)
fichh=$(find $carpeta -type f -name "*.h" | wc -l)

c=$(find $carpeta -type f -name "*.c" | wc -c)


echo "Hay $fichc ficheros con extension .c y $fichh con extension .h"

comando=$(find $carpeta -type f -name "*.h" )
comando2=$(find $carpeta -type f -name "*.c")

for array in $comando
do
lin=$(wc -l < $array )
car=$(wc -c < $array)

echo "El fichero $array tiene $lin lineas y $car caracteres" >> ordenacion.txt


done

for array in $comando2
do
lin=$(wc -l < $array)
car=$(wc -c < $array)

echo "El fichero $array tiene $lin lineas y $car caracteres" >> ordenacion.txt
done

sort -r -n -k8 ordenacion.txt
echo "" > ordenacion.txt
