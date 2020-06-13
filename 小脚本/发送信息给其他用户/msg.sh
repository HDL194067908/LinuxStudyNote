#!/bin/bash
#1、检查用户是否登陆
#2、检查该用户是否开启接收信息
#3、检查是否有信息输入
#4、读取信息并发送

muser=$1

user=$( who | grep -i -m 1 $muser | gawk '{print $1}' )

if [ -z $user ]
then 
  echo "$user is not logged on."
  echo "Exiting script..."
  exit
fi

allowed=$( who -T | grep -i -m 1 $muser | gawk '{print $2}' )

if [ $allowed != "+" ]
then
  echo "$1 does not allowing messaging."
  echo "Exiting script..."
  exit
fi

if [ -z $2 ]
then 
  echo "No message parameter included."
  echo "Exiting script..."
  exit
fi

shift
while [ -n "$1" ]
do
  message=$message' '$1
  shift
done

uterminal=$( who | grep -i -m 1 $muser | gawk '{print $2}' )
echo $message | write $user $uterminal
exit
