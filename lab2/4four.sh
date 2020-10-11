#!/bin/bash
for pid in $(ps -Ao pid | tail -n +2); do

tmp="/proc/"$pid
ppid=$(grep -Ehsi "ppid:\s+(.+)" $tmp"/status" | grep -o "[0-9]\+")
rtime=$(grep -Ehsi "se\.sum_exe_runtime(.+):\s+(.+)" $tmp/sched | awk '{print $3}')
swtc=$(grep -Ehsi "nr_switches(.+):\s+(.+)" $tmp/sched | awk '{print $3}')

if [ -z $ppid ]; then
ppid=0;
fi
if [ -z $rtime ] || [ -z $swtc ]; then
ART=0
else
ART=$(echo "scale=5; $rtime/$swtc" | bc | awk '{print "%f", $0}')
fi
echo "$pid $ppid $ART"
done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}'>task4.txt

