#!/bin/bash
cd /home/ubuntu
aws s3 cp s3://java-maven/order_service.zip .
unzip order_service.zip -d order_service/
cd order_service/
nohup java -jar order-service.jar  > /dev/null 2>&1 &
