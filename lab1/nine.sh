#!/bin/bush

files=$(ls /var/log/*.log)
let count=0

for file in $files;
do
let count+=$(cat $file | wc -l)
done

echo $count
