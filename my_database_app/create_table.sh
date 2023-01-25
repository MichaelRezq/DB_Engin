#!/usr/bin/bash
echo "insert you table name"
read table_name
#vaildate table name


touch $table_name

echo "insert num of fields for $table_name "
read fields_num
let fields_num=fields_num
#let sum=$fields_num+5
#echo $sum
#validate the fields num
echo "your table fields will be $fields_num"

#insert your meta data
echo "insert your meta data "
for ((i=1;i<=$fields_num;i++))
do
	echo insert column num $i name
	read col_name
	row_name+=$col_name:
done

	echo $row_name >> $table_name

#insert your type of data

echo "insert your type of  data "
for ((i=1;i<=$fields_num;i++))
do
	echo insert column num $i type
	read col_type
	row_type+=$col_type:
done

	echo $row_type >> $table_name

