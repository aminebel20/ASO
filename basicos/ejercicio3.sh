#!/bin/bash
ls -la /etc > listado_etc.txt
cat listado_etc.txt
echo "Número líneas: $(grep -c '^' < listado_etc.txt)"
echo "Número palabras: $(wc -w < listado_etc.txt)"