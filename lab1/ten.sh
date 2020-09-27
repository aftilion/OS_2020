#!/bin/bash

man bash |
awk '{ for ( i = 1; i <=NF; i++) if (length($i) >= 4) print $i }' |
sort | uniq -c |
sort -n -k 1 --reverse |
head -3
