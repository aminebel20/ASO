#!/bin/bash
if [ $# -lt 4 ] || [ $# -gt 5 ]; then
    echo "Error. La sintaxis correcta es:"
    echo "$0 alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

operacion=$1
nombre=$2
apellido1=$3
apellido2=$4
grupo=$5

# Generar identificativo del usuario
inicial_nombre=${nombre:0:1}
dos_apellido1=${apellido1:0:2}
dos_apellido2=${apellido2:0:2}
usuario="alu${dos_apellido1}${dos_apellido2}${inicial_nombre}"

case $operacion in
    alta)
        if [ -z "$grupo" ]; then
            grupo=$usuario
            sudo groupadd $grupo
        fi
        
        if ! getent group $grupo > /dev/null; then
            echo "Error: El grupo $grupo no existe"
            exit 1
        fi
        
        if id "$usuario" &>/dev/null; then
            echo "Error: El usuario $usuario ya existe"
            exit 1
        fi
        
        sudo useradd -m -g $grupo -s /bin/bash $usuario
        echo "Usuario $usuario creado y añadido al grupo $grupo"
        ;;
        
    baja)
        if ! id "$usuario" &>/dev/null; then
            echo "Error: El usuario $usuario no existe"
            exit 1
        fi
        
        sudo userdel -r $usuario
        echo "Usuario $usuario eliminado"
        ;;
        
    *)
        echo "Error. Operación no válida: $operacion"
        echo "Use 'alta' o 'baja'"
        exit 1
        ;;
esac