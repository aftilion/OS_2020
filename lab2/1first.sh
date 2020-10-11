
#!/bin/bash

pro=$(ps -u root | tail -n +2 | awk '$1 -eq "root" {print $1,$4}')
lines=$(echo "$pro" |wc -l)

echo "count : $lines" > task1.txt
echo -e "\n$pro" >>  task1.txt
