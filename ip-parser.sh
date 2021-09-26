#!/bin/bash
check_ip () {
ipaddr=$(sudo /sbin/ifconfig -a | grep -o 'inet [0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+' | grep -o [0-9].*)
num1=0
for ip in $ipaddr
do
num1=$((num1+1))
echo " $num1 $ip" >>results.txt
done
}

check_int () {
interfaces=$(ls /sys/class/net/)
num2=0
for int in $interfaces
do
num2=$((num2+1))
sed -i "s/ $num2 /$int /" results.txt
done
}

check_ip
check_int


if [ $# == 0 ]
then
cat results.txt && >results.txt

else

for i in $*
do
grep -q "$i " results.txt
if [ $? == 0 ]
then
cat results.txt | grep $i
else
echo "$i - interface not found"
fi
done
>results.txt
fi

