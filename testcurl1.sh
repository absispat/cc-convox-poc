v1="DEV-2879  fdfdf  cvcvcv vc testing dfdfdfd"

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

v1="$v1 $n1 $n2"
echo $v1 
