#!/bin/bash

NOW=$(date)
IP=$(hostname -I)
echo "$NOW - $IP" >> ~/practice/my-first-repo/Day4/log.txt
