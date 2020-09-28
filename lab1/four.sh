#!/bin/bash

if [[ "$(pwd)" == "$HOME" ]] 
then
echo "$(pwd)"
exit 0
else
echo "Error!"
exit 1
fi
