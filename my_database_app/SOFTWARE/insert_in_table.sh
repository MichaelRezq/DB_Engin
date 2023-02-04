#!/usr/bin/bash



# ========== (0) check if the table is empty    ========
echo ${#array[*]}
if  [[ ${#array[*]} -eq 0 ]]
then 
	echo "  
	your table is empty , Insert your first data 
	"
fi
# ========== (1) let the user select the table first   ========
echo "
-----> Select your Table number from the menu <--------
"
array=(`ls`)
echo " your data  "
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
num_fields=`head -1 $table_name | awk -F: '{print NF}'`
echo $num_fields

for ((i=1;i<$num_fields;i++))
do
	#validate the field num
	while true
	do 
		# read the input
		read -p "insert filed num $i: "
		field=$REPLY

		case $field in
			#the name can't be empty
				'' ) 
				echo "the filed can't be empty."
								continue ;;
			# the name can't have spaces
				*[[:space:]] | [[:space:]]* ) 
					echo "the filed can't start or end with any spaces"
								continue;;
			# the name must start with a-zA-z then can be zero or more a-zA-Z-0-9_.
				[a-zAZ0-9_]*[a-zAZ0-9_] )
				# search if the field is number one ?
				if [[ $i == '1' ]]
				then 
				echo " you are in first filed "
				if  [ $filed -eq [0-9] ]  
				then 
				# search if the pk exist in the table
				if  (cat $table_name | grep ^$field) &> ~/../../dev/null 
				then
				echo $field
				echo "
				ops looks like  $field is Already exist write a uniqe pk
						"
								continue
					else
								row+=$field:
					echo "your primary key is $field"

								break
				fi
				else
					echo "the primary key must be integer"
									continue 
					fi
				else 
					row+=$field:
					break 
				fi 
				
						break ;;
				* )
				echo " write a valid input "
				     continue ;;
		esac
	done

# end of validation 
	# row+=$field:
done
echo $row >> $table_name
echo "you inserted your data successfully"


echo "
 To return to the main menu press 1 
to continue inserting press 2 
"
select choice in  Return_to_main_menu Continue_connecting_to_DB
do
	case $choice in
	Return_to_main_menu) 
			../../SOFTWARE/database.sh
	    break ;;
		Continue_connecting_to_DB)
		break;;
		*) echo "Invalid choice" ;;
	esac
done	

