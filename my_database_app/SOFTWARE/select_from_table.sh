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
columns=`sed -n '1p' "$table_name"  | awk 'BEGIN{ RS = ":";} {print $0}'`

select choice in Select_all Select_column Select_row
do
	case $choice in
	Select_all ) echo "selecting all fields "
	cat $table_name
	break
	;;
	Select_column ) 
	    echo "Choose the column you want select it: " 
		select ch in $columns
    	do 
        	awk -F: '{print $'$REPLY'}' $table_name 
			break
    	done
		break
		;;

	Select_row ) 
		while true
		do
		read -p "input your id(PK) row: " pk
		row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
		# check the PK exist
		if grep -Fxq "$row" "$table_name" &> ~/../../dev/null;
		then
			echo "------------------------"
			echo `head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $0}'`
			echo "------------------------"
			echo `grep ^$pk $table_name | awk 'BEGIN{ RS = ":";} {print $0}' `
			break
		else
			echo "id(PK) '$pk' dosent't exist please press 'enter' and write valid id"
			continue
		fi
		done
		break
		;;
esac
done
