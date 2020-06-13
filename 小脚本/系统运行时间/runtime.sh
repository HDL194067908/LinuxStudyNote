#!/bin/bash
while true
do
 time=$(cat /proc/uptime | gawk -F.  '{days=$1 / 86400; 
 hours=($1%86400)/3600;
 min=($1%3600)/60;
 sec=$1%60;
 printf("系统已运行:%d天%d时%d分%d秒\n",days,hours,min,sec)
 }')
# echo -ne "\r$time"
 dialog --no-shadow --infobox $time 0 0
 sleep 1
 clear
done
