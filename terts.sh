git tag > test34aa.txt
t1=`sed 'x;$!d' test34aa.txt`
t2=`sed -n -e '$p' test34aa.txt`

echo $t1
echo $t2
git log --pretty=oneline $t1..$t2 > gittagdiff35aa.txt
