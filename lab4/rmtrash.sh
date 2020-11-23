#!bin/bash

TRASHDIR=~/.trash
TRASHLOG=~/.trash.log
FILE="$PWD/$1"
LNAME=$(date +"%s")

   if [[ $# != 1 ]];
   then
       echo "Arguments exception"
       exit 1
   fi

   if [[ ! -f $FILE ]];
   then
       echo "Filename exception"
       exit 1
   fi

   if [[ ! -d $TRASHDIR ]]; then
       mkdir $TRASHDIR
       touch $TRASHLOG
   fi

   ln "$FILE" "$TRASHDIR/$LNAME"
   echo "$FILE $LNAME" >> $TRASHLOG
   rm "$FILE"
