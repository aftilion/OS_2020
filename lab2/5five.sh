#!/bin/bush

n=0
m=0
curppid=-1
echo -n "" > task5.txt
while read i
do
IFS=' : ' read -r -a inf <<< "$i"
if [[ $curppid = ${inf[1]} ]]
 then
let n=$n+1
m=$(echo "scale=5; $m+${inf[2]}" | bc | awk '{printf "%f, $0}')
else
if [[ $curppid != "-1" ]]
 then
m=$(echo "scale=6; $m/$n" | bc | awk '{printf "%f",$0}')
echo "AVG_sleeping_choldren_of_ParentID=$curppid is $m" >> task5.txt
fi
curppid=${inf[1]}
n=1
m=${inf[2]}
fi
echo $i >> task5.txt
done < task4.txt
