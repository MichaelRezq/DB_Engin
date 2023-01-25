#!/usr/bin/bash

#array=`ls`
#echo ${array[*]}

#select choice in  ${array[*]}
#do
#	if [ $REPLY -gt ${#array[*]} ]
#	then
#		echo $REPLY bad choice try again
#	else
#		echo $REPLY
#		break
#	fi
#	done	
echo "insert table name to insert data in "
read table_name

let num_fields=`head -1 $table_name | awk -F: '{print NF}'`

for ((i=1;i<$num_fields;i++))
do
	
	echo "insert filed num $i"
	read field
	#validate the field num
	row+=$field:
done
echo $row >> $table_name
echo "you inserted your data successfully"
