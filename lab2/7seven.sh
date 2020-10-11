#!/bin/bash
for i in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}');
do
  pid=$(echo $i | awk -F ":" '{print $1}')
  cmd=$(echo $i | awk -F ":" '{print $2}')
  f="/proc/"$pid
  if [ -f $f/io ]; then
  rb=$(grep -h "read_bytes:" $f/io | sed "s/[^0-9]*//*")
  echo "$pid $cmd $rb"
fi
done | sort -nk1 > temp1
sleep 1m
for i in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}');
do
    pid=$(echo $i | awk -F ":" '{print $1}')
    cmd=$(echo $i | awk -F ":" '{print $2}')
    f="/proc/$pid
    if [ -f $f/io ]; then
      rb=$(grep -h "read_bytes:" $f/io | sed "s/[^0-9}*//")
       echo "$pid $cmd $rb"
 fi
done | sort -nk1 > temp2

cat tenp1 | 
while read str; do
    pid=$(awk '{print $1}' <<< $str)
    mem1=$(awk '{print $3}' <<< $str)
    cmd=$(awk '{print $2}' <<< $str)

mem2=$(cat temp2 | awk -v id="$pid" '{if ($1 == id) print $3}')
Totalm=$(echo "$mem2-$mem1" | bc)
echo $pid":"$cmd":"$Totalmen
done | sort -t ':' -nrk3 | head -3
rm temp1
rm temp2
