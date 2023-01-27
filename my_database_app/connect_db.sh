#!/usr/bin/bash
PS3="  Type your DB number to connect with: "

echo
echo "-----> Select your DB number from the menu <--------"
echo
array=(`ls -F | grep / | tr / " "`)


# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY not on the menu"
		continue
	else
		cd ${array[${REPLY}-1]}
		
		echo "
		...You are connected to  ${array[${REPLY}-1]} DB ..."
		echo
		break 
	fi
done	
	echo

	PS3="  Type your choice number : "

 select choice in Create_table List_tables Drop_table Insert_in_table Select_from_table Delete_from_table Update_from_table Remove_table
 do
	 case $choice in 
		 Create_table ) echo "
		 creating table..."
			 ../create_table.sh
			 ;;
		 List_tables ) echo "listing tables... "
			 ../list_tables.sh
			 ;;
		 Drop_table ) echo "Dropping table..."
			 ../drop_table.sh
			 ;;
		 Insert_in_table ) echo "inserting in table..."
			../insert_in_table.sh
			 ;;
		 Select_from_table ) echo "Selecting from table..."
			../select_from_table.sh
			 ;;
		 Delete_from_table ) echo "Deletting from table..."
			 ../delete_from_table.sh
			 ;;
		 Update_from_table ) echo "Updatting from table..."
			../update_from_table.sh
			 ;;
		 * ) "not a propriate choice try again "
			 ;;
	 esac
 done

