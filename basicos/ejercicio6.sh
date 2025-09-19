#!/bin/bash
read -p "Introduce una palabra: " palabra
echo "$palabra" >> lista.txt
echo "Palabra añadida al archivo lista.txt"