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


# check if table is exist
if [[ -f $table_name ]] ;
then
select choice in Delete_All  Delete_Row
do
	case $choice in 

		# if user select del all
		Delete_All )
			sed -i '/^[[:digit:]]/d' $table_name
			echo "All Rows deleted successfully"
			break
			;;

		# if user select del row
		Delete_Row )
		while true
		do

		# get the pk of row
		read -p "input your id(PK) row: " pk
		row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
		# check the PK exist
		if grep -Fxq "$row" "$table_name" &> ~/../../dev/null;
		then
			sed -i '/'$row'/d' $table_name
			echo "Row deleted successfully"
			break
		else
			echo "id(PK) '$pk' dosent't exist please write valid id"
			continue
		fi
		done
		break
			;;

		* ) echo chose a valid choice 
			;;
	esac 
done	
else
	echo "$table_name doesn't exist press enter to try again!!"
fi
