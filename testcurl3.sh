echo "Release Notes" > rinfo.txt 
while read p; do
 echo "$p"
# echo $p | cut -d " " -f 2

v1=`echo $p`

v2=`echo $v1 | grep -o 'DEV-[^ ,]\+'`

if [ -z "$v2" ]
then
     echo "\$v2 is empty"
else
     # echo "\$v2 is NOT empty"
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

fi


done <gittagdiff34.txt
