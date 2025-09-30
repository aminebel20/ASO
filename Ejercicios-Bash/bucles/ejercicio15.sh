#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <número>"
    exit 1
fi

n=$1

echo "Tabla de multiplicar del $n:"
for i in {1..10}; do
    resultado=$((i * n))
    echo "$i x $n = $resultado"
done
