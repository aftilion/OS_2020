#!bin/bash

grep -Eo "[A-Za-z0-9]+:x:[0-9]+" /etc/passwd|
sed "s/:x:/ / " |
sort -n -k 2
