#!/bin/bash

dates=$(date '+%F_%T')

mkdir $HOME/test && {  echo "catalog test was created successfully" > $HOME/report ; touch $HOME/test/$dates ; }



ping www.net_nikogo.ru || echo "${dates} host is not available" >> $HOME/report
