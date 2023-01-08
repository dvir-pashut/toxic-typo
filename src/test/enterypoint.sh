#!/bin/bash


## a simple for loop that will create a file containing 20 tests and send it to the python script
for (( i=$from; i<=$to; i+=20 )); do
    cat e2e | head -n $i | tail -n 20 > e2e.file$i
    python e2e_test.py $app e2e.file$i  &
done
wait
