#!/usr/bin/bash
read -p "Enter the id(PK) of coulmn: " pk
# echo $table_name
# awk -F: '{print $0;exit}' $table_name
# columns=`head -1 $table_name`

columns=`head -1 "$table_name" | awk 'BEGIN{ RS = ":";} {print $1}'`

numOfRow=`awk -F: '{if($1=='$pk') print NR-2}  ' $table_name `
echo $numOfRow
row=`awk -F':' ' {  if($1=='$pk')  print $0}' $table_name  `
# values=('youssef')
echo $row


# sed -i.bak -r 's/asa/'${values[0]}'/g' $table_name
# awk -F':' '{for (i=1; i<NF; i++) if ( NR-2 == '$numOfRow' ) print $i}' $table_name



# echo ${values[*]}
# echo ${columns[*]}
let num_fields=`head -1 $table_name | awk -F: '{print NF}'`
arr=()
userVal=()

for col in $columns
do
arr+=($col)

done
# echo ${arr[2]}



# for col in $columns
# do
# arr+=($col)

# done
# # echo ${#arr[*]}

for ((i=1;i<$num_fields-1;i++))
do
	
	echo "enter ${arr[$i]} value"
	read field
    userVal+=($field)
	#validate the field num

	# row+=$field:
done
echo ${userVal[*]}

# echo "Choose the column you want change it"
#change select choice in $columns
#     do 
#         echo "You $choice"
#     done