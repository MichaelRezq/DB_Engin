#!/usr/bin/bash
echo insert table name
read table_name

select choice in Column_name row
do 
	case $choice in 
	Column_name ) echo column name
		;;
	row ) echo row
		;;
esac
done
