echo "Release info" > rinfo.txt 
while read p; do
 echo "$p"
# echo $p | cut -d " " -f 2

v1=`echo $p`

v2=`echo $v1 | grep -o 'DEV-[^ ,]\+'`

#echo $v1

url1="https://selfscore.atlassian.net/rest/api/3/issue/$v2?fields=summary,assignee"

#echo $url1


n1=`curl --request GET \
  --url $url1 \
  --header 'Authorization: Basic cm9zaGFuQGNsZGN2ci5jb206UjBzYW5AMTI=' | json fields.assignee.displayName`

n2=`curl --request GET \
  --url $url1 \
  --header 'Authorization: Basic cm9zaGFuQGNsZGN2ci5jb206UjBzYW5AMTI=' | json fields.summary`

v1="$v1 Assignee: $n1  Ticket Summary : $n2"
echo $v1
echo $v1 >> rinfo.txt


done <gittagdiff3.txt
