#!/bin/bash

TRASHDIR=~/.trash
TRASHLOG=~/.trash.log

restore() {
   FN=$1
   TN=$2
   RDIR=$(echo "$FN" | awk 'BEGIN{FS=OFS="/"}; {$NF=""; print $0}')
   FNN=$(echo "$FN" | awk 'BEGIN{FS="/"}; {print $NF}')
   NFN=""


   if [[ ! -d $RDIR ]];
   then
        echo "Directory ${RDIR} does't exists. \"${FNN}\" will be restored in home directory"
        if [[ -f "${HOME}/${FNN}" ]];
        then
        read -p "File \"~/${FNN}\" already exists. New name: " NFN
        ln "${TRASHDIR}/${TN}" "${HOME}/${NFN}"
        rm "${TRASHDIR}/${TN}"
        else
        ln "${TRASHDIR}/${TN}" "${HOME}/${FNN}"
        rm "${TRASHDIR}/${TN}"
        fi
   else
        if [[ -f "${FN}" ]];
        then
        read -p "File \"${FN}\" already exists. New name:" NFN
        ln "${TRASHDIR}/${TN}" "${RDIR}/${NFN}"
        rm "${TRASHDIR}/${TN}"
        else
        ln "${TRASHDIR}/${TN}" "${FN}"
        rm "${TRASHDIR}/${TN}"
        fi
   fi

}

  if [[ $# != 1 ]];
  then
      echo "Arguments exception"
      exit 1
  fi

  if [[ ! -d $TRASHDIR ]];
  then
      echo "Trash directory exception"
      exit 1
  fi

  if [[ ! -f $TRASHLOG ]];
  then
      echo "Trash log exception"
      exit 1
  fi

  if [[ -z $(grep "$1" $TRASHLOG) ]];
  then
      echo "File $1 doesnt exist "
      exit 1
  fi

  if [[ $(grep -E "/$1 " $TRASHLOG) == "" ]];
  then
           echo " Exception with filename or we nwwd only name"
           exit 1
  fi


   for  tr in $(grep "$1 " $TRASHLOG | awk '{print $NF}');do 
         FN=$(grep  $tr   $TRASHLOG | awk '{$NF=""; print $0}')
         FN=$(echo "$FN" | sed  's/ *$//')
         read -p "Restore ${FN}? [y/n] " ans
 


        case  "$ans" in
            "Y" | "y")
                     restore "$FN" $tr
                     sed "/${tr}/d" $TRASHLOG > ~/.trash.log2 && mv ~/.trash.log2 $TRASHLOG
                ;;
            "N" | "n")
                continue
             ;;
            *)

;;
esac

done

