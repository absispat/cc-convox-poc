while read p; do
 # echo "$p"
 echo $p | cut -d " " -f 2
done <gittagdiff1.txt
