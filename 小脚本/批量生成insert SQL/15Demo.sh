#!/bin/bash
#15章实例：生成SQL Insert语句
outfile="insert.sql"
IFS=','
while read code name tid brand pic num price intro status
do
  cat >> $outfile << EOF
  INSERT INTO insert(code,name,tid,brand,pic,num,price,intro,status) VALUES("$code","$name","$tid","$brand","$pic","$num","$price","$intro","$status");
EOF
done < ${1}

