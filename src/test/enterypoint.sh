#!/bin/bash

sleep 3
for (( i=0; i<=400; i+=50 )); do
    echo $i
    cat e2e | head -n $i | tail -n 50 > e2e.file$i
    python e2e_test.py tox-app:8080 e2e.file$i 1 &
done

sleep 20
