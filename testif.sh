vi="DEV-2879 fdfdf cvcvcv vc testing dfdfdfd Abhishek Patil CC test GITJIRA"
v2=`echo $vi | grep -o 'DEV-[^ ,]\+'`

if [ -z "$v2" ]
then
      echo "\$v2 is empty"
else
      echo "\$v2 is NOT empty"
fi
