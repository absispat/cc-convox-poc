git tag > test34.txt
t1=`sed 'x;$!d' test34.txt`
t2=`sed -n -e '$p' test34.txt`

echo $t1
echo $t2
git log --pretty=oneline $t1..$t2 >> gittagdiff.txt
