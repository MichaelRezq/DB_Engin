#!/usr/bin/bash

echo choose from the folowing
select choice in Create_Db List_Db Connect_Db Drop_Db
do
	case $choice in
		Create_Db ) echo Creating Database..
			./create_db.sh
			;;
		List_Db ) echo Listing Database...
			./list_db.sh
			;;
		Connect_Db ) echo Connecting Database...
		source ./connect_db.sh
			;;
		Drop_Db ) echo Dropping Database ...
			./drop_db.sh
			;;
		* ) echo $REPLY is not a valid choice 
			echo try again
	esac
done
