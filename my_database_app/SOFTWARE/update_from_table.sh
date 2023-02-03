#!/usr/bin/bash

# get table name


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


# get id of row 
read -p "Enter the id(PK) of row: " pk

# get names of column
columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $1}'`

# get the row which want update it
row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `

# check the PK exist
if grep -Fxq "$row" "$table_name" > /dev/null;
then

		# get number of field to loop on it because didn't know nums of field
		let num_fields=`head -1 $table_name | awk -F: '{print NF}'`
		arr=()

		for col in $columns
		do
		arr+=($col)
		done

		# print field name and get values from user
		for ((i=1;i<$num_fields-1;i++))
		do
			
			read -p "enter value of (${arr[$i]}): " field
			
			userVal+=$field":"
		done

		# update the row in file
		sed -i 's/'$row'/'$pk":"$userVal'/' $table_name

		echo "row updated  successfully"

else
	echo "id(PK) '$pk' dosent't exist please write valid id"
	../../SOFTWARE/update_from_table.sh;
fi





