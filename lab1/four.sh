#!/bin/bush

if [[ "$(pwd)" == "$HOME" ]] 
then
echo "$(pwd)"
exit(0)
else
echo "Run from home directory!"
exit(1)

