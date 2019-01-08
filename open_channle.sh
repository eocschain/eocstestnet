#!/bin/sh
#send openchannel tx
#The IP port and plug-in mode need to be modified before use


getres(){
 ret=`echo $1|cut -d "," -f3`
 ret=`echo $ret|cut -d ":" -f2`
 i=`expr $ret - 26`
 echo $i
}


exec1="curl --request POST   --url http://127.0.0.1:8765/v1/eoc_icp/open_channel"
exec11="curl --request POST   --url http://127.0.0.1:8899/v1/eoc_icp/open_channel"
exec2=" -d'"
exec4="' "
p1=`curl --request POST --url http://127.0.0.1:8765/v1/chain/get_info`
p2=`curl --request POST --url http://127.0.0.1:8899/v1/chain/get_info`

p1=`getres $p1`
p2=`getres $p2`

echo $p1,$p2

exec3="{\"seed_block_num_or_id\":\"$p1\"}"

exec0=$exec1$exec2$exec3$exec4
#echo $exec0
#echo "$exec0"|sh >> op.txt
#echo $exec0
#echo $aa

exec33="{\"seed_block_num_or_id\":"\"$p2\""}"



exec00=$exec11$exec2$exec33$exec4
echo $exec0";"$exec00 > op.sh


sh op.sh
#echo "$exec00"|sh >> op.txt

#bb=`$exec00`
#echo $bb
sleep 2

echo "\n open channle end"

curl --request POST   --url http://127.0.0.1:8765/v1/eoc_icp/get_info;
curl --request POST   --url http://127.0.0.1:8899/v1/eoc_icp/get_info;
