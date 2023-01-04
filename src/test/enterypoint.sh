#!/bin/bash

# cat e2e | head -n 50 > e2e.1-50
# cat e2e | head -n 100 | tail -n 50 > e2e.51-100
# cat e2e | head -n 150 | tail -n 50 > e2e.101-150
# cat e2e | head -n 200 | tail -n 50 > e2e.151-200
# cat e2e | head -n 250 | tail -n 50 > e2e.201-250
# cat e2e | head -n 300 | tail -n 50 > e2e.251-300
# cat e2e | head -n 350 | tail -n 50 > e2e.301-350
# cat e2e | head -n 399 | tail -n 50 > e2e.350-399


# python e2e_test.py tox-app:8080 e2e.51-100  1 &
# python e2e_test.py tox-app:8080 e2e.101-150 1 &
# python e2e_test.py tox-app:8080 e2e.151-200 1 &
# python e2e_test.py tox-app:8080 e2e.201-250 1 &
# python e2e_test.py tox-app:8080 e2e.251-300 1 &
# python e2e_test.py tox-app:8080 e2e.350-399 1 



for (( i=0; i<=400; i+=25 )); do
    cat e2e | head -n $i | tail -n 25 > e2e.file
    python e2e_test.py tox-app:8080 e2e.file  1 &
done