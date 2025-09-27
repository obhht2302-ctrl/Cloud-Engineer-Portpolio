#!/bin/bash

NOW=$(date)
IP=$(hostname -I)
echo "$NOW - $IP" >> /home/obhml/log.txt
