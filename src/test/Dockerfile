FROM python:2.7.18

COPY . .

RUN pip install -r requirments.txt

ENTRYPOINT [ "python", "e2e_test.py", "tox-app:8080", "e2e", "2" ]