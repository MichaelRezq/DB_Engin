#!/usr/bin/bash


#vaildate table name

echo "----------------------------"
echo "Already exist Tables..."
ls -S 
echo "                               "

# validating the input name
while true
do 
# read the input
read -p "inter different name for your new table : "
 table_name=$REPLY

case $table_name in
#the name can't be empty
	'' ) echo "the name can't be empty."
					continue ;;
# the name can't have spaces
	*[[:space:]] | *[[:space:]]* | [[:space:]]* ) echo "the name can't have any spaces"
					continue;;
# the name can't tart with numbers.
	[0-9]* ) echo " the name can't start with numbers"
					continue;;
# the name must start with a-zA-z then can be zero or more a-zA-Z-0-9_.
	*[a-zA-Z_]*[a-zAZ0-9_] | [a-zA-z_] )
	# search if the name exist in the list?
	if (find $table_name  `ls -F ` &> ~/../../dev/null )
	then
	echo "ops looks like  $table_name DB is Already exist"
	echo "                               "
					continue
	else
				touch $table_name 
		echo "congrats you created table named $table_name"
		echo "                               "
					break
	fi
	  					;;
# the name cant have special caracter.
	* ) echo " the name can't have special caracters"
			echo "                               "
					continue;;
esac
done

# then inserting data to the table

read -p "insert num of fields for $table_name table: " fields_num

let fields_num=fields_num
#let sum=$fields_num+5
#echo $sum
#validate the fields num
#echo "your table fields will be $fields_num"

#insert your meta data
echo "
------------->insert your meta data  for $table_name table
"
for ((i=1;i<=$fields_num;i++))
do
	# validating the input name
while true
do 
# read the input
read -p "column num $i name is: " 
col_name=$REPLY
case $col_name in
#the name can't be empty
	'' ) echo "the name can't be empty."
					continue;;
# the name can't have spaces
	*[[:space:]] | *[[:space:]]* | [[:space:]]* ) echo "the name can't have any spaces"
					continue;;
# the name can't tart with numbers.
	[0-9]* ) echo " the name can't start with numbers"
					continue;;
# the name must start with a-zA-z then can be zero or more a-zA-Z-0-9_.
	*[a-zA-Z_]*[a-zAZ0-9_] | [a-zA-z_] )
	# search if the name exist in the list?
	if (find $col_name  `ls -F ` &> ~/../../dev/null )
	then
	echo "ops looks like  $col_name DB is Already exist"
	echo "                               "
					continue
	else
				row_name+=$col_name:
					break
	fi
		  					;;
# the name cant have special caracter.
	* ) echo " the name can't have special caracters"
			echo "                               "
					continue;;
esac
done


	row_name+=$col_name:
done

	echo $row_name >> $table_name

#insert your type of data

echo "	
------------->insert your type of  data  for $table_name table
"
for ((i=1;i<=$fields_num;i++))
do
	read  -p "column number $i type is: " col_type
	row_type+=$col_type:
done

	echo $row_type >> $table_name

