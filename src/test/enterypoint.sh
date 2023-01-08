#!/bin/bash

for (( i=$t; i<=$key; i+=20 )); do
    cat e2e | head -n $i | tail -n 20 > e2e.file$i
    python e2e_test.py $app e2e.file$i  &
done
wait
