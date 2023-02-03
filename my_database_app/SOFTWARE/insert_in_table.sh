#!/usr/bin/bash

# ========== (1) let the user select the table first   ========

echo "
-----> Select your Table number from the menu <--------
"
array=(`ls`)
# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY is not on the menu
		"
		continue
	else
		echo "
		... You selected ${array[${REPLY}-1]} Table...
		"
			table_name=${array[${REPLY}-1]} 
		break 
	fi
done	

# ========== (1) let the user insert in the  the table    ========

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
