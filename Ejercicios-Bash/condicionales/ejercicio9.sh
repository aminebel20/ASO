#!/bin/bash
echo "OPERACIONES MATEMÁTICAS"
echo "------- Menú ----------"
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"

read -p "Selecciona una opción (1-4): " opcion
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

case $opcion in
    1) resultado=$(echo "$num1 + $num2" | bc)
       echo "Suma: $resultado" ;;
    2) resultado=$(echo "$num1 - $num2" | bc)
       echo "Resta: $resultado" ;;
    3) resultado=$(echo "$num1 * $num2" | bc)
       echo "Multiplicación: $resultado" ;;
    4) if [ $num2 -eq 0 ]; then
           echo "Error: No se puede dividir por cero"
       else
           resultado=$(echo "scale=2; $num1 / $num2" | bc)
           echo "División: $resultado"
       fi ;;
    *) echo "Opción no válida" ;;
esac