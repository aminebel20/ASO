#/bin

if [ $# -ne 1 ]; then
    echo "Uso: $0 directorio"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: $1 no es un directorio"
    exit 1
fi

fecha=$(date +%Y-%m-%d)
nombre_archivo="${fecha}_$(basename $1).tar.gz"
tar -czf "$nombre_archivo" "$1"
echo "Archivo $nombre_archivo creado correctamente"