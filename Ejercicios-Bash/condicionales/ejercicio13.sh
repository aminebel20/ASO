#!/bin/bash
archivo="lista.txt"

mostrar_menu() {
    echo "AGENDA - MENÚ PRINCIPAL"
    echo "1. Añadir registro"
    echo "2. Buscar"
    echo "3. Listar todo"
    echo "4. Ordenar"
    echo "5. Borrar archivo"
    echo "6. Salir"
}

añadir_registro() {
    read -p "Nombre: " nombre
    read -p "Dirección: " direccion
    read -p "Teléfono: " telefono
    echo "$nombre|$direccion|$telefono" >> $archivo
    echo "Registro añadido correctamente"
}

buscar() {
    read -p "Buscar por (nombre/direccion/telefono): " campo
    read -p "Texto a buscar: " texto
    
    case $campo in
        nombre) grep -i "$texto" $archivo | awk -F'|' '{print "Nombre: "$1", Dirección: "$2", Teléfono: "$3}' ;;
        direccion) grep -i "$texto" $archivo | awk -F'|' '{print "Nombre: "$1", Dirección: "$2", Teléfono: "$3}' ;;
        telefono) grep -i "$texto" $archivo | awk -F'|' '{print "Nombre: "$1", Dirección: "$2", Teléfono: "$3}' ;;
        *) echo "Campo no válido" ;;
    esac
}

listar() {
    if [ -f $archivo ]; then
        echo "CONTENIDO DE LA AGENDA:"
        awk -F'|' '{print "Nombre: "$1", Dirección: "$2", Teléfono: "$3}' $archivo
    else
        echo "El archivo no existe"
    fi
}

ordenar() {
    if [ -f $archivo ]; then
        sort $archivo -o $archivo
        echo "Archivo ordenado alfabéticamente"
    else
        echo "El archivo no existe"
    fi
}

borrar() {
    if [ -f $archivo ]; then
        rm $archivo
        echo "Archivo borrado"
    else
        echo "El archivo no existe"
    fi
}

while true; do
    mostrar_menu
    read -p "Selecciona una opción (1-6): " opcion
    
    case $opcion in
        1) añadir_registro ;;
        2) buscar ;;
        3) listar ;;
        4) ordenar ;;
        5) borrar ;;
        6) echo "¡Hasta pronto!"; exit 0 ;;
        *) echo "Opción no válida" ;;
    esac
    echo
done