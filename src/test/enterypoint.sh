#!/bin/bash


for (( i=0; i<=400; i+=25 )); do
    echo $i
    cat e2e | head -n $i | tail -n 25 > e2e.file
    python e2e_test.py tox-app:8080 e2e.file &
done