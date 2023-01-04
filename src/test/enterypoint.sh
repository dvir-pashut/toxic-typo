#!/bin/bash

cat e2e | head -n 50 > e2e.1-50
cat e2e | head -n 100 | tail -n 50 > e2e.51-100
cat e2e | head -n 150 | tail -n 100 > e2e.101-150
cat e2e | head -n 200 | tail -n 150 > e2e.151-200
cat e2e | head -n 250 | tail -n 200 > e2e.201-250
cat e2e | head -n 300 | tail -n 250 > e2e.251-300
cat e2e | head -n 350 | tail -n 300 > e2e.301-350
cat e2e | head -n 399 | tail -n 350 > e2e.350-399


python e2e_test.py tox-app:8080 e2e.51-100  5 &
python e2e_test.py tox-app:8080 e2e.101-150 5 &
python e2e_test.py tox-app:8080 e2e.151-200 5 &
python e2e_test.py tox-app:8080 e2e.201-250 5 &
python e2e_test.py tox-app:8080 e2e.251-300 5 &
python e2e_test.py tox-app:8080 e2e.350-399 5 


