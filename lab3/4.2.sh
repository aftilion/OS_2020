#!/bin/bash

sh 4.1.sh&res1=$!
sh 4.1.sh&res2=$!
sh 4.1.sh&res3=$!

renice +10 -p $res1

at now +1 minute <<< "kill ${res3}"
at now +5 minute <<< "kill ${res1} ; kill ${res2}"
