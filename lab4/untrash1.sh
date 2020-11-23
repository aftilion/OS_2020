#!/bin/bash

if [ -f $HOME.trash.log ];
then
   echo "exception trash.log
    exit 1
fi


if [ $# -ne 1 ];
then
       echo "Argument exception"
       exit 1
fi

if [[ $(grep -E "/$1 " $HOME/.trash.log) == "" ]]
then
   echo "Exception with filename"
   exit 1
fi


echo "$(grep - E "/$1" $HOME/.trash.log)" |
while read line ;
do

        trash_path=$(echo "$line" | awk '{print $2}')
        last_path=$(echo "$line" | awk '{print $1}')
        read -p "Recover $last_path (y/n)" ans <&1
          case $ans in
        "Y" | "y")
        if ! [ -f $trash_path ];
        then
            echo " This file is now inavailible"
             continue
         fi
        if ! [ -d $(echo "$last_path" | awk -F"/$1" '{print $1}') ];
           then
                echo "Init dir not availible , recover to homedir"
                ln $trash_path
                rm $trash_path
                continue
            fi
   if [ -f $last_path ];
   then
    read -p "File $last_path exists , new name" name <&1
     ln $trash_path "$(echo "$last_path" | awk -F"/$1" '{print $1}')"/$name
     rm $trash_path
continue

fi
           ln $trash_path $last_path
rm $trash_path

grep -EV "$last_path" ~.trash.log > ~.tmp.log
cat ~.tmp.log > ~.trash.log
rm ~.tmp.log

;;
"n" | "N")
continue
;;
*)
echo "Invalid and"
;;
esac
done
