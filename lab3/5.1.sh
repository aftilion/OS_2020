#!/bin/bash

while true; do

  read line 
  echo "$line" > buff

     if [[ "$line" == "QUIT" ]]; then
      exit 0
     fi


     if [[ "$line" != "+" && "$line" != "*" && ! "$line" =~ [0-9]+ ]]; then
          echo "Error"
          exit 1
     fi
done
