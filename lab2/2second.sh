#!bin/bash

ps -ax -o pid,command | awk '{print $1 " " $2}' | grep -E "[0-9]+ /sbin/" > task2.txt

