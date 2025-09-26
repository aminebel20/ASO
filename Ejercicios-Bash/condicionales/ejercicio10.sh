#!/bin/bash
read -p "Introduce un número: " numero

if [ $((numero % 2)) -eq 0 ]; then
    echo "$numero es par"
else
    echo "$numero es impar"
fi