#!/usr/bin/bash
tar -xf mm2090-apr2021-attendance.tar.gz
cd mm2090-apr2021-attendance
t=$(ls|wc -l)
echo "Total no. of class" $t
echo Enter roll nunber
read r
a=$(egrep -l $r *|wc -l)
p=$(echo 100*$a/$t|bc -l)
echo "Lectures missed"
egrep -L $r *|grep -o L..
echo Attendance $(echo $p|egrep -o "^[[:digit:]]+\...")\%
cd ..
rm -r mm2090-apr2021-attendance
