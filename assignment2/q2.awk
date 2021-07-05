#!/usr/bin/gawk
BEGIN{

}
{
 if($6==m)
 {	if($(($d - $7))<=$n)
		print $9;
 }
}
END{

}
