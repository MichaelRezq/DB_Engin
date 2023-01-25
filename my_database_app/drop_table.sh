#!/usr/bin/bash
echo "insert table name to drop "
read drop_name
#validate if the name of file already exist

read -p "Are you sure to delete $drop_name?(y/n)"
if [ $REPLY=[yY] ]
then
	rm $drop_name
	echo "$drop_name table dropped successfully"
fi

