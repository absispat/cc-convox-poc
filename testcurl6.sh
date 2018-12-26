git tag > test34.txt
t1=`sed 'x;$!d' test34.txt`
t2=`sed -n -e '$p' test34.txt`

echo $t1
echo $t2
git log --pretty=oneline $t1..$t2 > gittagdiff35.txt

echo "Release Notes" > rinfo.txt
while read p; do
 echo "$p"

v1=`echo $p`

v2=`echo $v1 | grep -o 'DEV-[^ ,]\+'`

if [ ! -z "$v2" ]
then    
url1="https://selfscore.atlassian.net/rest/api/3/issue/$v2?fields=summary,assignee"




n1=`curl --request GET \
  --url $url1 \
  --header 'Authorization: Basic cm9zaGFuQGNsZGN2ci5jb206UjBzYW5AMTI=' | json fields.assignee.displayName`

n2=`curl --request GET \
  --url $url1 \
  --header 'Authorization: Basic cm9zaGFuQGNsZGN2ci5jb206UjBzYW5AMTI=' | json fields.summary`

v1="$v1 Assignee: $n1  Ticket Summary : $n2"
echo $v1
echo $v1 >> rinfo.txt

fi


done <gittagdiff35.txt
