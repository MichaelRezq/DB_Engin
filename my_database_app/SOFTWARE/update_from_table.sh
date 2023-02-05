#!/usr/bin/bash

# chose table name

echo "-----> Select your Table you want to update it <--------"
array=(`ls`)

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
columns=`sed -n '1p' "$table_name"  | awk 'BEGIN{ RS = ":";} {print $0}'`
# Get meta data
types=`sed -n '2p' "$table_name" | awk 'BEGIN{ RS = ":";} {print $0}'`

# get the row which want update it
row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name `

# check the PK exist
if grep -Fxq "$row" "$table_name" &> ~/../../dev/null;

then

		# get number of field to loop on it because didn't know nums of field
		let num_fields=`head -1 $table_name | awk -F: '{print NF}'`
		arr=()
		theType=()
		flag=()
		for col in $columns
		do
		arr+=($col)
		done

		for t in $types
		do
		theType+=($t)
		done

		# print field name and get values from user
		for ((i=1;i<$num_fields-1;i++))
		do
		while true
		do
			
			read -p "enter value of (${arr[$i]}) [${theType[$i]}]: " field
			if [ "${theType[$i]}" == "string" ]
			then
			case $field in
				*[a-zA-Z0-9] ) userVal+=$field":" 
				break
				;;
				'' ) userVal+=null: 
				echo "the field will be null"
				break
				;;
				*)  echo "please inter valid value"
				flag+=("faild")
				 continue
				 ;;
			
			esac
			elif [ "${theType[$i]}" == "integer"  ]
			then
				case $field in
					[1-9] | [1-9]*[0-9] ) userVal+=$field":" 
					break
					;;
					'' ) userVal+=null: 
					echo "the field will be null"
					break
					;;
					*)  echo "please inter valid value"
					flag+=("faild")
					continue
					;;
				esac
			fi
			done
		done

			# check no errors
			if [[ ${flag[*]} != "faild" ]]
				then
				# update the row in file
				sed -i 's/'$row'/'$pk":"$userVal'/' $table_name
				echo "row updated  successfully"
			fi
else
	echo "id(PK) '$pk' dosent't exist please write valid id"
	# ../../SOFTWARE/update_from_table.sh;
fi