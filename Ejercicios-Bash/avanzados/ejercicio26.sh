#!/bin/bash

echo "Buscando archivos con permisos peligrosos..."
find / -type f -perm -007 2>/dev/null > archivos_peligrosos.txt

echo "Búsqueda completada. Resultados guardados en archivos_peligrosos.txt"
echo "Número de archivos encontrados: $(wc -l < archivos_peligrosos.txt)"