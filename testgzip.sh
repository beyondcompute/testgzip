# bash progress bar code from http://moblog.bradleyit.com/2010/02/simple-bash-progress-bar-function.html
show_bar () {
  percDone=$(echo 'scale=2;'$1/$2*100 | bc)
  barLen=$(echo ${percDone%'.00'})
  bar=''
  fills=''
  for (( b=0; b<$barLen; b++ ))
  do
    bar=$bar'█'
  done
  blankSpaces=$(echo $((100-$barLen)))
  for (( f=0; f<$blankSpaces; f++ ))
  do
    fills=$fills" "
  done
  printf "$barLen%%\t$bar$fills\n"
}

testgzip () {
  #because Google, for instance, don't serve gzip to curl
  user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.71 Safari/537.36"

        full=$(curl $@ -k --silent --write-out "%{size_download}" --output /dev/null -H "User-Agent: $user_agent")
  printf "\tnon-compressed:\n$full\t"
  show_bar $full $full

  compressed=$(curl $@ -k --silent --write-out "%{size_download}" --output /dev/null -H "User-Agent: $user_agent" -H "Accept-Encoding: gzip,deflate")
  printf "\tgzip:\n$compressed\t"
  show_bar $compressed $full
}
