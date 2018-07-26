#!/bin/bash

if [ ${#@} == 0 ]; then
        echo "Usage:./openssl-brute <encfile> <encryption> <wordlist>"
        echo "Example:./openssl-brute test.txt.enc bf-cbc rockyout.txt"
        exit 1
fi

file="$1"
enc="$2"
wordlist="$3"

while read word; do
        openssl enc -d -$enc -a -in $file -k ${word} 2>/dev/null
        RET=$?
        if [ $RET -eq 0 ]; then
                echo "Candidate password: ${word}"
        fi
done < "$wordlist"
