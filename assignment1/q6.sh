#!/usr/bin/bash
echo "enter atomic no."
read atno
r=$(cat q6.csv|gawk -v atno=$atno '{if($1==atno) print $5}')
cat q6.csv|gawk -v atno=$atno '{if($1==atno) {print "element choosed:",$2; print"its radius:",$5;}}'
echo "criterian for closeness:$(echo 0.9*$r|bc -l)-$(echo 1.1*$r|bc -l) pm" 
cat q6.csv|gawk -v r=$r 'BEGIN{c=0; print "elements in range"}{if($5>=0.9*r&&$5<=1.1*r){c++;print $2}}END{print "Total elements in range:",c}'
