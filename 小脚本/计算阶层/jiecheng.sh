#!/bin/bash
#递归计算阶层
function calculate {
if [ $1 == 1 ]
then 
   echo 1
else
   local temp=$[ $1 - 1 ]
   local result=$(calculate $temp)
   echo $[ $result*$1 ]
fi
}
read -p "enter a num : " num
result=$(calculate $num)
echo "result : $result"

