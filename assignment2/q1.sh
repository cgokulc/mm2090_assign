#!/usr/bin/bash

echo "Enter the 4 digit number (nnnn):"
read n
input_check=0

str_check=$(echo $n|grep -o "[[:alpha:]]*") #extracting alphabets
flt_check=$(echo $n|grep -o "\.")    #storing no. of dots
if [ "$n" = "$str_check"  ];then
echo "You have entered a string, Please enter 4 numeric digits"
elif [ $n = $(echo $n|grep -o "[[:digit:]]*"|head -n 1)  ];then
	if [ ${#n} -eq 4  ];then
	echo "The Input was as expected."
	input_check=1
	else
	echo "You have not enter a number but it is not a 4 digit number, Please enter 4 numeric digits"
	fi
elif [ ${#flt_check} -gt 0  ];then
echo "You have entered a float, Please enter 4 numeric digits only"
else
echo "Input was not as expected, Please enter 4 numeric digits"
fi

if [ $input_check -eq 1 ];then  #for checking input is valid

for i in 1 2 3 4;do
(( d$i=$(echo $n|cut -c $i) )) #seperating each digit and storing in d1,d2,d3,d4
done;

a=("0" "1" "A B C" "D E F" "G H I" "J K L" "M N O" "P Q R S" "T U V" "W X Y Z")

for h in ${a[$d1]};do
for j in ${a[$d2]};do
for k in ${a[$d3]};do
for l in ${a[$d4]};do
echo $h $j $k $l
done;
done;
done;
done;

fi;
