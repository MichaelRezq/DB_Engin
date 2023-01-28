#!/usr/bin/bash
PS3="=>Type your choice: "
echo choose from the folowing
select choice in Create_Db List_Db Connect_Db Drop_Db
do
	case $choice in
		Create_Db ) echo "
		Creating Database.."
			source ./create_db.sh
			;;
		List_Db ) echo "
		Listing Database..."
			source ./list_db.sh
			;;
		Connect_Db ) echo "
		Connecting Database..."
		source  ./connect_db.sh
			;;
		Drop_Db ) echo "
		Dropping Database ..."
			source ./drop_db.sh
			;;
		* ) echo $REPLY "
		is not a valid choice "
			echo try again
	esac
done
