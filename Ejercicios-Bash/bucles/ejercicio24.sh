#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

if [ ! -d "$directorio" ]; then
    echo "Error: $directorio no existe o no es un directorio"
    exit 1
fi

ficheros=0
subdirectorios=0

for entrada in "$directorio"/*; do
    if [ -f "$entrada" ]; then
        ficheros=$((ficheros + 1))
    elif [ -d "$entrada" ]; then
        subdirectorios=$((subdirectorios + 1))
    fi
done

echo "Estadísticas del directorio: $directorio"
echo "Número de ficheros: $ficheros"
echo "Número de subdirectorios: $subdirectorios"
echo "Total: $((ficheros + subdirectorios))"