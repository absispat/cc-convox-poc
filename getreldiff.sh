git tag > test343.txt
t1=`sed 'x;$!d' test343.txt`
t2=`sed -n -e '$p' test343.txt`

echo $t1
echo $t2
#echo "Changes made to master branch " > gittagdiff3.txt
git log --pretty=oneline $t1..$t2 > gittagdiff3.txt
