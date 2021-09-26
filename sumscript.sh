#!/bin/bash
if [ $# == 3 ]
then
SUM=0
for i in $@
do
echo "$1" | grep -q "^[0-9]*$"
if [[ $? == 0 ]]
then
    SUM=$((SUM+$1))
    shift 1
else
   echo "$1 is not number"
	shift 1
fi
done
echo "Sum=$SUM"
	
else
	echo "Please enter 3 arguments"
fi
