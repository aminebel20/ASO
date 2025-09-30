#!/bin/bash

#  FOR
suma_f=0
for ((i=1; i<=1000; i++)); do
    suma_f=$((suma_f + i))
done
echo "Suma con FOR: $suma_f"

#  WHILE
suma_w=0
i=1
while [ $i -le 1000 ]; do
    suma_w=$((suma_w + i))
    i=$((i + 1))
done
echo "Suma con WHILE: $suma_w"

#  UNTIL
suma_u=0
i=1
until [ $i -gt 1000 ]; do
    suma_u=$((suma_u + i))
    i=$((i + 1))
done
echo "Suma con UNTIL: $suma_u"