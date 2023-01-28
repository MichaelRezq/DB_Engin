#!/usr/bin/bash
echo "
-----> Select your Table number from the menu <--------
"
array=(`ls`)


# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY is not on the menu
		"
		continue
	else
		echo "
		... You selected ${array[${REPLY}-1]} Table...
		"
			table_name=${array[${REPLY}-1]} 
		break 
	fi
done	




 
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

	Select_row ) 
		read -p "input your id(PK) row: " pk
		row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
		# check the PK exist
		if grep -Fxq "$row" "$table_name" > /dev/null;
		then
			echo "------------------------"
			echo `head -1 "$table_name"`
			echo "------------------------"
			echo `grep ^$pk $table_name `
		else
			echo "id(PK) '$pk' dosent't exist please press 'enter' and write valid id"
		fi
		;;
esac
done
