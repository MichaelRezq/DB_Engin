#!/usr/bin/bash
# get table name
read -p "Write table name to delete: " table_name

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
			;;

		# if user select del row
		Delete_Row )
		
		# get the pk of row
		read -p "input your id(PK) row: " pk
		row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
		# check the PK exist
		if grep -Fxq "$row" "$table_name" > /dev/null;
		then
			sed -i '/'$row'/d' $table_name
			echo "Row deleted successfully"
		else
			echo "id(PK) '$pk' dosent't exist please press 'enter' and write valid id"
		fi
			;;

		* ) echo chose a valid choice 
			;;
	esac 
done	
else
	echo "$table_name doesn't exist press enter to try agin!!"
fi
