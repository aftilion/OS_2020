#!/bin/bash

grep -rohsaE "[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z]+" /etc |
tr '\n' ',' > email.list
