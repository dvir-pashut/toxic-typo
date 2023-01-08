#!/bin/bash

aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.eu-west-3.amazonaws.com

docker rm -f tox-app

docker pull 644435390668.dkr.ecr.eu-west-3.amazonaws.com/dvir-toxictypo:latest

docker run -d -p 80:8080 --name tox-app 644435390668.dkr.ecr.eu-west-3.amazonaws.com/dvir-toxictypo:latest