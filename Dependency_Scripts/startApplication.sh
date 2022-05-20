#!/bin/bash
cd /home/ubuntu
unzip order_service.zip -d order_service/
cd order_service/target/
nohup java -jar order-service.jar  > /dev/null 2>&1 &
