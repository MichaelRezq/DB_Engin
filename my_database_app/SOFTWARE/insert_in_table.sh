#!/usr/bin/bash
array=(`ls`)
# ========== (0) check if the table is empty    ========
# echo ${#array[*]}
# if  [[ ${#array[*]} -eq 0 ]]
# then 
# 	echo "  
# 	your table is empty , Insert your first data 
# 	"
# fi


# ========== (1) let the user select the table first   ========
echo "
-----> Select your Table number from the menu <--------
"

# echo " your data  "
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
		# let the choice -1 as the choices are listed in the array from 0
			table_name=${array[${REPLY}-1]} 
		break 
	fi
done	

#  
	# ============================ set variables ============================
# get names of column
columns=`sed -n '1p' "$table_name"  | awk 'BEGIN{ RS = ":";} {print $0}'`
# echo $columns
# Get meta data
types=`sed -n '2p' "$table_name" | awk 'BEGIN{ RS = ":";} {print $0}'`
# echo $columns
# echo $types
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

let num_fields=`head -1 $table_name | awk -F: '{print NF}'` -1
# echo $num_fields
# ========== (1) let the user insert in the  the table    ========

for ((i=0;i<$num_fields-1;i++))
do
	#validate the field num
	while true
	do 
		# read the input
		read -p "enter value of (${arr[$i]}) [${theType[$i]}] "
		field=$REPLY
		case $field in
			#the name can't be empty
				'' ) 
				if [[ $i == '0' ]]
					then 	
						echo "the pk can't be null."
					continue
					else
						echo "the filed will be null."
						row+=null:
					break 
				fi
				;;
			# the name can't have spaces
				*[[:space:]] | [[:space:]]* ) 
					echo "the filed can't start or end with any spaces"
								continue;;
			# the name must start with a-zA-z then can be zero or more a-zA-Z-0-9_.
				[a-zA-Z0-9_]*[a-zA-Z0-9_] | [a-zA-Z0-9_] )
					if [ "${theType[$i]}" == "string" ]
						then
						case $field in
							*[a-zA-Z0-9] )
							 	row+=$field:
									break ;;
							*)  
								echo "please inter valid value"
								flag+=("faild")
									continue ;;
						esac
					elif [ "${theType[$i]}" == "integer" ]
						then
							case $field in
								[1-9] | [1-9]*[0-9] ) 
								# search if the field is number one  "pk"?
									if [[ $i == '0' ]]
										then 
										# search if the pk exist in the table
										if  ( cat  $table_name | grep ^$field ) &> ~/../../dev/null 
												then
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
										row+=$field:
									fi
											;;
								*) 
								echo "please inter valid value"
									flag+=("faild")
									continue ;;
							esac 
						fi 
						break ;;
				# if the user inputs any other data
				* )
				echo " write a valid input "
				     continue ;;
		esac
	done
# end of validation 
done

echo $row >> $table_name

echo "
you inserted your data successfully
"


# echo "
#             choose from the menu
 
# "
# select choice in  Return_to_main_menu Continue_connecting_to_DB
# do
# 	case $choice in
# 	Return_to_main_menu) 
# 			../../SOFTWARE/database.sh
# 	    break ;;
# 		Continue_connecting_to_DB)
# 		break;;
# 		*) echo "Invalid choice" ;;
# 	esac
# done	
