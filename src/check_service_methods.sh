#!/bin/bash

#检查Service层方法名是否以add|modify|remove|get|is|exists开始
echo "检查Service层方法名是否以add|modify|remove|get|is|exists开始"
for classname in `find ./com/sunny/ecerp/service/ -name "*[Ss][Ee][Rr][Vv][Ii][Cc][Ee].class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  echo ${classname}
  javap -p ${classname} | grep "(" | sed 's/(.*//g' | sed 's/.* //g' | grep -v '^[add|modify|remove|get|is|exists]'
done

#检查Service层方法是否抛出ServiceException
echo "检查Service层方法是否抛出ServiceException"
for classname in `find ./com/sunny/ecerp/service/ -name "*.class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  javap -p ${classname} | grep -v 'ServiceException' | grep -v 'private'
done
