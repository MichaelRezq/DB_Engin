#!/usr/bin/bash


#===================== (1)  list tables to the users   ==============

echo "----------------------------"
echo "Already exist Tables...
"
ls -S 

#===================== (2)  let user create a valid table name and not exist in the list of tables    ==============

while true
do 
# read the input
read -p "
inter different name for your new table : 
"
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


#===================== (3)  let user insert data to the table    ==============

# read the number of fildes
while true
do 
read -p "insert num of fields for $table_name table: " 
 fields_num=$REPLY

case $fields_num in
				*[0] ) echo "the your table number of fields can't be  $fields_num "
				continue ;;
*[1-9] | *[1-9]*[0-9] ) echo "your table number of fields is  $fields_num "
				break;;
				* ) echo "write a valid number"
				continue;;

esac
done

#insert your meta data
let fields_num=fields_num

echo "
------------->insert your meta data  for $table_name table <-----
"
echo "      first insert column names
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
	'' ) echo "               
	the name can't be empty.    
	"
					continue;;
# the name can't have spaces
	*[[:space:]] | *[[:space:]]* | [[:space:]]* ) echo "                 
	the name can't have any spaces
	"
					continue;;
# the name can't tart with numbers.
	[0-9]* ) echo " 
	                the name can't start with numbers
					"
					continue;;
# the name must start with a-zA-z then can be zero or more a-zA-Z-0-9_.
	*[a-zA-Z_]*[a-zAZ0-9_] | [a-zA-z_] )
	# search if the name exist in the list?
	if (find $col_name  `head -1 $table_name` &> ~/../../dev/null )
	then
	echo "
	        ops looks like  $col_name column name is Already exist
	"
					continue
	else
				row_name+=$col_name:
					break
	fi
		  					;;
# the name cant have special caracter.
	* ) echo " 
	          the name can't have special caracters"
			echo "                               "
					continue;;
esac
done


done

	echo $row_name >> $table_name

#insert your type of data

echo "	
      second insert column types
"

PS3="=>Type your choice: "

for ((i=1;i<=$fields_num;i++))
do
#   only support string and integer
select choice in string integer
do 
case $choice in 
string ) echo string
			row_type+=string:
				break;;
integer ) echo integer
			row_type+=integer:
				break;;
	* )  echo "
	only 1 and 2 are available
	"
				continue;;
esac
done 
done
	echo $row_type >> $table_name
echo "     
your table meta data is 
$row_name
$row_type 

"
