#!/bin/bash
type="+"
number=1
tail -f buff |
while true;
do
     read line
                case $line in
                        "+")
                                type="$line"
                         ;;

                         "*")
                                type="$line"
                         ;;
            "QUIT")
                      kilall tail
                      exit 0
             ;;
             [0-9]*)
                      case $type in
                          "+")
                                number=$(($number + $line))
                                echo $number
                           ;;
                          "*")
                                number=$(($number * $line))
                                echo $number
                           ;;
               esac
            ;;
       *)
            killall tail
            exit 1
          ;;
    esac
done
