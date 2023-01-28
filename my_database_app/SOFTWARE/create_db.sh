#!/usr/bin/bash
#create_database
echo "----------------------------"
echo "Already exist databases..."
cd ../DATA_Do_NOT_EREASE 

ls -F | grep / | tr / " "
echo "                               "

# validating the input name
while true
do 
# read the input
read -p "inter different name for your new database : "
 db_name=$REPLY

case $db_name in
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
	*[a-zA-Z_]*[a-zAZ0-9_] | [a-zA-z] )
	# search if the name exist in the list?
	if (find $db_name  `ls -F | grep /` &> ~/../../dev/null )
	then
	echo "ops looks like  $db_name DB is Already exist"
	echo "                               "
					continue
	else
	read -p  "Are you sure to create $db_name DB  (Y/N) ?"  name_insist
	echo $name_insist
	if [[ $name_insist == [yY] ]]
	then
				mkdir $db_name 
		echo "congrats you created database named $db_name"
		echo "                               "
					break
			else 
					break
			fi
	fi
	  					;;
# the name cant have special caracter.
	* ) echo " the name can't have special caracters"
			echo "                               "
					continue;;
esac
done

cd - &> ~/../../dev/null