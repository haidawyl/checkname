#检查DAO层是否含有@Transactional标签
grep -r "@Transactional" ./com/sunny/ecerp/dao/ | grep -v "svn"

#检查实现类命名是否正确
find ./ -name "*Imp\.java" | grep -v "svn"
