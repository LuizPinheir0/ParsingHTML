#!/bin/bash

if [ "$1" = "" ]; then
    echo "Luiz PinheirO - Parsing HTML"
    echo "Usage: $0 DOMAIN"
    echo "Exemplo: $0 domain.com.br"
else
    output_file="output.txt"
    wget "$1" -O "$output_file"
    cat "$output_file" | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 2 > lista
    for url in $(cat lista); do
        host $url | grep "has address"
    done
fi
