#!/bin/bash

existe() {
    local archivo=$1
    if [ -f "$archivo" ]; then
        chmod u+x "$archivo"
        echo "El archivo $archivo existe y se ha hecho ejecutable para el propietario"
        return 0
    else
        echo "El archivo $archivo no existe"
        return 1
    fi
}

if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

existe "$1"