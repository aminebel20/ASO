#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

directorio=$1

if [ ! -d "$directorio" ]; then
    echo "Error: $directorio no es un directorio válido"
    exit 1
fi

contador=0

echo "Contenido de $directorio:"
for entrada in "$directorio"/*; do
    if [ -f "$entrada" ]; then
        echo "Fichero: $(basename "$entrada")"
    elif [ -d "$entrada" ]; then
        echo "Directorio: $(basename "$entrada")"
    fi
    contador=$((contador + 1))
done

echo "Total de entradas procesadas: $contador"
