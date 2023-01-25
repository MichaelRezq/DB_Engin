#!/usr/bin/bash
list=`ls -F | grep /`
read -p "insert DB name to delete ? "
del_db=$REPLY
#if grep $REPLY $list
#then
	read -p "Are you sure to del. $REPLY (y/n) ? "
	if [  $REPLY=[yY] ]
	then
	rm -r $del_db
	echo "you deleted the DB named $del_db successfully "
	fi
#else 
#	echo "insert a valid name "
#fi
