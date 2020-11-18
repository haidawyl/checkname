#!/bin/bash

#检查JAVA方法名首字母是否小写
for classname in `find . -name "*.class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  javap -p ${classname} | grep "(" | sed 's/(.*//g' | sed 's/.* //g' | grep -v '^[a-z]' && echo ${classname}
done
