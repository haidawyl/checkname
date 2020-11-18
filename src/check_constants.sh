#!/bin/bash

#检查JAVA常量是否使用了final声明
for classname in `find . -name "*.class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  echo ${classname}
  javap -p ${classname} | grep -v "[(|{]" | grep "static" | grep -v "final"
done
