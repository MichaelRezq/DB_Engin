#!/usr/bin/bash
 read -p "Write table name: " table_name
 
#validate table name
columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $1}'`

select choice in Select_all Select_column Select_row
do
	case $choice in
	Select_all ) echo "selecting all fields "
	cat $table_name
	;;
	Select_column ) 
	    echo "Choose the column you want select it: " 
		select ch in $columns
    	do 
        	awk -F: '{print $'$REPLY'}' $table_name 
    	done
		;;
	Select_row ) read -p "input your id(PK) row: " pk
		# validation on PK
		echo "------------------------"
		echo `head -1 "$table_name"`
		echo "------------------------"
		echo `grep ^$pk $table_name `
		;;
esac
done
