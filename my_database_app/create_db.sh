#!/usr/bin/bash
#create_database
read -p "inter a you database name name ? "
 db_name=$REPLY

case $db_name in
	+[[:space:]] ) echo "the name can't start with space";;
	[0-9]* ) echo " the name can't start with numbers";;
	^[a-zA-Z_] ) echo " the name can't start with sp.caracters";;
	[a-zA-Z_]* )echo congrats you created database named $db_name
		mkdir $db_name;;
esac
