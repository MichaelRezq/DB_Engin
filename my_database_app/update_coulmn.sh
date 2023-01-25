#!/usr/bin/bash
read -p "Enter the id(PK) of coulmn: " pk
# echo $table_name
# awk -F: '{print $0;exit}' $table_name
# columns=`head -1 $table_name`

columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $1}'`

numOfRow=`awk -F: '{if($1=='$pk') print NR-2}  ' $table_name `
row=`awk -F':' ' {  if($1=='$pk') print $0}' $table_name  '`
echo $row

# echo `head -1 "$table_name" | awk -F: '{print NF-1}' `

# echo "Choose the column you want change it"
# select choice in $columns
#     do 
#         echo "You $choice"
#     done