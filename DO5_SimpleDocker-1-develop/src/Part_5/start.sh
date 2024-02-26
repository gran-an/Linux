#!/bin/bash
gcc -Werror -Wextra -Wall main.c -lfcgi -o main
service nginx start
nginx -s reload
spawn-fcgi -p 8080 ./main
while true; do wait 
done
/bin/bash

