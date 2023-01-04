#!/bin/bash

# cat e2e | head -n 50 > e2e.1-50
# cat e2e | head -n 100 | tail -n 50 > e2e.51-100
# cat e2e | head -n 150 | tail -n 50 > e2e.101-150
# cat e2e | head -n 200 | tail -n 50 > e2e.151-200
# cat e2e | head -n 250 | tail -n 50 > e2e.201-250
# cat e2e | head -n 300 | tail -n 50 > e2e.251-300
# cat e2e | head -n 350 | tail -n 50 > e2e.301-350
# cat e2e | head -n 399 | tail -n 50 > e2e.350-399

# sleep 1
# python e2e_test.py tox-app:8080 e2e.1-50  &
# python e2e_test.py tox-app:8080 e2e.51-100   &
# python e2e_test.py tox-app:8080 e2e.101-150  &
# python e2e_test.py tox-app:8080 e2e.151-200  &
# python e2e_test.py tox-app:8080 e2e.201-250  &
# python e2e_test.py tox-app:8080 e2e.251-300  &
# python e2e_test.py tox-app:8080 e2e.301-350  &
# python e2e_test.py tox-app:8080 e2e.350-399




for (( i=$t; i<=$key; i+=25 )); do
    cat e2e | head -n $i | tail -n 25 > e2e.file$i
    python e2e_test.py tox-app:8080 e2e.file$i 1 &
done
wait
