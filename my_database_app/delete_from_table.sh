#!/usr/bin/bash

echo "insert table name to delete "
read table_name

select choice in Delete_All Delete_column Delete_Row
do
	case $choice in 
		Delete_All ) echo delettig all table data 
			;;
		Delete_column )echo deletting column 
			;;
		Delete_Row )echo deleting row 
			;;
		* ) echo chose a valid choice 
			;;
	esac 
done	
