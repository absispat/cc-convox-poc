git tag > test34.txt
t1=`sed 'x;$!d' test34.txt`
t2=`sed -n -e '$p' test34.txt`

#echo $t1
#echo $t2
git log --pretty=oneline $t1..$t2 > gittagdiff35.txt

echo "Release Notes\n" > rinfo.txt

while read p; do
 echo "$p"

v1=`echo $p`

v2=`echo $v1 | grep -o 'DEV-[^ ,]\+' || echo "dnd"`

if [ $v2 == "dnd" ]
then

echo $v1 >> rinfo.txt

else

url1="https://selfscore.atlassian.net/rest/api/3/issue/$v2?fields=summary,assignee"

n=`curl --request GET \
  --url $url1 \
  --header 'Authorization: Basic cm9zaGFuQGNsZGN2ci5jb206UjBzYW5AMTI='`


n1=`echo "$n" | json fields.assignee.displayName`

n2=`echo "$n" | json fields.summary`

v1="$v1 | Assignee: $n1 |  Ticket Summary : $n2"
echo $v1
echo $v1 >> rinfo.txt

fi

done <gittagdiff35.txt
