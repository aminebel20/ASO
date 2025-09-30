#!/bin/bash

numero_secreto=42
intentos=0

echo "Adivina el número entre 1 y 100 (introduce 0 para rendirte)"

while true; do
    read -p "Tu intento: " intento
    intentos=$((intentos + 1))
    
    if [ "$intento" -eq 0 ]; then
        echo "Te has rendido. El número era $numero_secreto"
        break
    elif [ "$intento" -eq "$numero_secreto" ]; then
        echo "¡Enhorabuena! Adivinaste en $intentos intentos"
        break
    elif [ "$intento" -lt "$numero_secreto" ]; then
        echo "El número es MAYOR"
    else
        echo "El número es MENOR"
    fi
done