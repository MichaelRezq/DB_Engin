#!/usr/bin/bash

PS3="  Type your Table number to Drop : "

echo -n "Enter Number: "
read x

if [ $((x%2)) == 0 ]; then
  echo "Number is Even"
else
  echo "Number is Odd"
fi


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
		$REPLY not on the menu
		"
		continue
	else
		rm   ${array[${REPLY}-1]}
		
		echo "
		... ${array[${REPLY}-1]} Table dropped successfully...
		"
		echo
		break 
	fi
done	

