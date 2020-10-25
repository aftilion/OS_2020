#!/bin/bash

number=1
type="+"

TERM() {

echo "quit"
exit 0

}

S1() {

type="+"

}

S2() {

type="*"

}

trap 'TERM' SIGTERM
trap 'S1' USR1
trap 'S2' USR2

while true;
do

        case "$type" in
                    "+")
                          number=$(echo "${number} + 2" | bc)
                     ;;

                    "*")
                          number=$(echo "${number} * 2" | bc)
                     ;;

             esac
                    sleep 44
                    echo $number
  done
