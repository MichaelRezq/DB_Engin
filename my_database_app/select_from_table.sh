#!/usr/bin/bash
echo "insert table name"
read table_name
#validate table name

select choice in Select_all Select_column Select_row
do
	case $choice in
	Select_all ) echo "selecting all fields "
	#sed -n 3  $table_name
	;;
	select_column ) echo "input your column name "
		read col_name
		#cut -d: 
		;;
	Select_row ) echo "input your pk row"
		read row_name
		grep ^$row_name $table_name
		;;
esac
done
