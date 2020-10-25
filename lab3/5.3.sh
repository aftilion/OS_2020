#!/bin/bash
mkfifo buff
sh 5.2.sh&sh 5.1.sh

rm buff
