#!/usr/bin/bash

cd ../DATA_Do_NOT_EREASE 

PS3="  Type your Table number to Drop : "

echo
echo "-----> Select your Table number from the menu <--------"
echo
array=(`ls -F | grep / | tr / " "`)


# echo ${#array[*]}

select choice in  ${array[*]}
do
	if [ $REPLY -gt ${#array[*]} ]
	then
		echo "
		$REPLY not on the menu"
		continue
	else
		rm -r ${array[${REPLY}-1]}
		
		echo "
		...Your ${array[${REPLY}-1]} DB deleted successfully ..."
		echo
		break 
	fi
done	


cd - &> ~/../../dev/null