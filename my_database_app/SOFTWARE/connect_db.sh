#!/usr/bin/bash
PS3="  Type your DB number to connect with: "

echo
echo "-----> Select your DB number from the menu <--------"
echo
cd ../DATA_Do_NOT_EREASE 
array=(`ls -F  | grep / | tr / " "`)


# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY not on the menu"
		continue
	else
		cd ../DATA_Do_NOT_EREASE/${array[${REPLY}-1]}
		
		echo "
		...You are connected to  ${array[${REPLY}-1]} DB ..."
		echo
		break 
	fi
done	
	echo

	PS3="  Type your choice number : "

 select choice in Create_table List_tables Drop_table Insert_in_table Select_from_table Delete_from_table Update_from_table 
 do
	 case $choice in 
		 Create_table ) echo "
		 creating table..."
			 ../../SOFTWARE/create_table.sh
			 ;;
		 List_tables ) echo "listing tables... "
			 ../../SOFTWARE/list_tables.sh
			 ;;
		 Drop_table ) echo "Dropping table..."
			 ../../SOFTWARE/drop_table.sh
			 ;;
		 Insert_in_table ) echo "inserting in table..."
			../../SOFTWARE/insert_in_table.sh
			 ;;
		 Select_from_table ) echo "Selecting from table..."
			../../SOFTWARE/select_from_table.sh
			 ;;
		 Delete_from_table ) echo "Deletting from table..."
			 ../../SOFTWARE/delete_from_table.sh
			 ;;
		Update_from_table ) echo "Updating from table..."
			 ../../SOFTWARE/update_from_table.sh
			 ;;
		 * ) "not a propriate choice try again "
			 ;;
	 esac
 done

cd - &> ~/../../dev/null