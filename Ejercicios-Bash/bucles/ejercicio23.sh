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

echo "Contenido detallado de $directorio:"
for entrada in "$directorio"/*; do
    nombre=$(basename "$entrada")
    
    if [ -f "$entrada" ]; then
        echo "Fichero regular: $nombre"
    elif [ -d "$entrada" ]; then
        echo "Directorio: $nombre"
    elif [ -L "$entrada" ]; then
        echo "Enlace simbólico: $nombre"
    elif [ -b "$entrada" ]; then
        echo "Archivo especial de bloque: $nombre"
    elif [ -c "$entrada" ]; then
        echo "Archivo especial de caracter: $nombre"
    else
        echo "Otro tipo: $nombre"
    fi
    
    contador=$((contador + 1))
done

echo "Total de entradas procesadas: $contador"