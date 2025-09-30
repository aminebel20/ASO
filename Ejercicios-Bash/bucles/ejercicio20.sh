#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <número>"
    exit 1
fi

n=$1

if [ $n -le 1 ]; then
    echo "$n no es primo"
    exit 0
fi

es_primo=1
for ((i=2; i*i<=n; i++)); do
    if [ $((n % i)) -eq 0 ]; then
        es_primo=0
        break
    fi
done

if [ $es_primo -eq 1 ]; then
    echo "$n es primo"
else
    echo "$n no es primo"
fi