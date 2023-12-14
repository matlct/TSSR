#!/bin/bash

rouge="\e[1;31m"
vert="\e[32m"
noir="\e[0m"

read -p "répertoire souhaité :" repertoire trash

if [ $repertoire -eq 0 ]; then
    echo -e "$rouge Syntaxe = <Script + répertoire> $noir"
    exit
fi
