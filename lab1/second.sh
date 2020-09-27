#!/bin/bash

res=""
input=""

read input 

while [[ "$input" != "q" ]]
do
res="$res$input"
read input 
done

echo "$res"
