#!/bin/bash
cd /home/ubuntu
aws s3 cp s3://java-maven/order_service.zip .
unzip -ox order_service.zip .
cd target/
nohup java -jar order-service.jar  > /dev/null 2>&1 &
