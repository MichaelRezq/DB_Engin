#!/usr/bin/bash

read -p "Write table name to delete: " table_name

if [[ -f $table_name ]] ;
then
select choice in Delete_All  Delete_Row
do
	case $choice in 
		Delete_All )
			sed -i '/^[[:digit:]]/d' $table_name
			echo "All Rows deleted successfully"
			;;
		
		Delete_Row ) read -p "input your id(PK) row: " pk
		
		#validation PK
		row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
		sed -i '/'$row'/d' $table_name
		echo "Row deleted successfully"
			;;
		* ) echo chose a valid choice 
			;;
	esac 
done	
else
	echo "$table_name doesn't exist press enter to try agin!!"
fi
