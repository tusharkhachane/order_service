#!/bin/bash
cd /home/ubuntu
for pid in $(lsof -t -i:5000); do                        kill -9 $pid;                done
rm -rf target/
rm -rf order_service.zip
aws s3 cp s3://java-maven/order_service.zip .
unzip order_service.zip
cd target/
nohup java -jar order-service.jar  > /dev/null 2>&1 &
