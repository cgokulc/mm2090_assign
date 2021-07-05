#!/usr/bin/bash
tar -xf screenshots.tar.gz
cd screenshots
echo "Enter the width of final image:"
read w
echo "Enter the height of final image:"
read h
echo "Enter the x pixel of top-left corner final image in original image:"
read x
echo "Enter the y pixel of top-left corner final image in original image:"
read y
j=1
count=6 #$(ls |wc -l)
for i in *
do
	convert  -crop $w\x$h\+$x\+$y "$i" "$j.jpg"
	j=$(echo $j + 1|bc)
done
k=2
c=1
while [ "$c" -eq 1 ]
do

	if test -f "$k.jpg"; then
		convert "$(echo $k - 1|bc).jpg" "$k.jpg" +append "a$(echo $k / 2|bc).jpg"
		k=$(echo $k + 2|bc)

	else
		c=0
	fi
done
b=1
((noofapp=count/2+1))
while [ "$b" -lt "$noofapp" ]
do 
	im[$((b-1))]="a$b.jpg"
	((b++))
done 
convert "${im[@]}" "../q3.pdf" 
cd ..
rm -r screenshots
