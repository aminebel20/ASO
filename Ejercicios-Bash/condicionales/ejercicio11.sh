#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Error: Se requieren exactamente 2 parámetros"
    echo "Uso: $0 archivo_origen archivo_destino"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: $1 no existe o no es un archivo ordinario"
    exit 1
fi

if [ -e "$2" ]; then
    echo "Error: Ya existe un elemento con el nombre $2"
    exit 1
fi

cp "$1" "$2"
echo "Archivo copiado correctamente: $1 -> $2"