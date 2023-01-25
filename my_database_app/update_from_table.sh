#!/usr/bin/bash
echo write table name
read table_name
export table_name

select choice in Column_name row
do 
	case $choice in 
	Column_name ) echo update with column name
			 ../update_coulmn.sh
		;;
	row ) echo row
		;;
esac
done
