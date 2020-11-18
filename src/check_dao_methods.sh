#!/bin/bash

#检查DAO层方法名是否以insert|update|delete|find开始
echo "检查DAO层方法名是否以insert|update|delete|find开始"
for classname in `find ./com/sunny/ecerp/dao/ -name "*[Dd][Aa][Oo].class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  echo ${classname}
  javap -p ${classname} | grep "(" | sed 's/(.*//g' | sed 's/.* //g' | grep -v '^[insert|update|delete|find]'
done

#检查DAO层方法是否抛出DAOException
echo "检查DAO层方法是否抛出DAOException"
for classname in `find ./com/sunny/ecerp/dao/ -name "*.class" | sed 's/\.class//g' | sed 's/^..//' | sed 's/\//\./g'`
do
  javap -p ${classname} | grep -v 'DAOException' | grep -v 'mapRow' | grep -v 'private'
done
