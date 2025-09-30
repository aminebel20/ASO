#!/bin/bash

obtener_info_red() {
    local ip=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $7}' | head -1)
    local interfaz=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5}' | head -1)
    local mascara=$(ifconfig $interfaz 2>/dev/null | grep netmask | awk '{print $4}')
    
    echo "=== INFORMACIÓN DE RED ==="
    echo "Interfaz: $interfaz"
    echo "IP Local: $ip"
    echo "Máscara: $mascara"
    echo
}

escanear_ips() {
    local base_ip="192.168.1"  # Cambiar según tu red
    
    echo "Escaneando IPs en la red $base.0/24..."
    echo "IP - Estado"
    echo "-----------"
    
    for i in {1..254}; do
        ip="$base_ip.$i"
        if ping -c 1 -W 1 "$ip" &> /dev/null; then
            echo "$ip - OCUPADA"
        else
            echo "$ip - LIBRE"
        fi
    done
}

# Función principal
main() {
    obtener_info_red
    escanear_ips
}

main