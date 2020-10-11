#!/bin/bash
#ps -e -o pid,vsz | sort -nrk2 | head -n1
mpid=-1
msize=-1
for pid in $(ls /proc/ | grep -E '[0-9]+')
do
  cursize=$(grep -isw "VmSize:" /proc/$pid/status | awk '{print $2}')

if [[ "cursize" -gt "$msize" ]]
then
mpid=$pid
msize=$cursize
fi
done
echo "$mpid: $msize" 
