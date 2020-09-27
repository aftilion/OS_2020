#!/bin/bash

grep -E "(\(II\)|\(WW\))" /var/log/anaconda/X.log |
sed "s/(II)/Information/; s/(WW)/Warning/" |
sort -k 3 --reverse > full.log

