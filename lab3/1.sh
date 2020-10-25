#!/bin/bash

dates=$(date '+%F_%T')
 
if ! [[ -d $HOME/test ]] ; then
 mkdir $HOME/test 
  echo "catalog test was created successfully" > $HOME/report
fi 
  touch $HOME/test/$dates 




ping www.net_nikogo.ru || echo "${dates} host is not available" >> $HOME/report
