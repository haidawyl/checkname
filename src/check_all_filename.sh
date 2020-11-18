#!/bin/bash

#检查jsp文件首字母是否大写
for classname in `find . -name "*.jsp"`
do
  basename ${classname} | grep -v '^[a-z]'
done

#检查js文件首字母是否大写
for classname in `find . -name "*.js"`
do
  basename ${classname} | grep -v '^[a-z]'
done

#检查java文件首字母是否小写
for classname in `find . -name "*.java"`
do
  basename ${classname} | grep -v '^[-Z]'
done
