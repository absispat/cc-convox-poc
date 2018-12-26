git tag > test34.txt
t1=`sed 'x;$!d' test34.txt`
t2=`sed -n -e '$p' test34.txt`

#echo $t1
#echo $t2
git log --pretty=oneline $t1..$t2 > gittagdiff35.txt

while read p; do
 echo "$p"

v1=`echo $p`

v2=`echo $v1 | grep -o 'DEV-[^ ,]\+' || echo "dnd"`


echo "v2:  $v2"
[  -z "$v2" ] && echo "Empty: Yes" || echo "Empty: No"







done <gittagdiff35.txt
