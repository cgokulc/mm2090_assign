#!/usr/bin/gawk -f
BEGIN{
FS=",";
}

{
d=substr($1,1,2);
p=tolower(substr($1,5,1));
n=substr($1,6,3);
l=length($2);
printf("%s%s%i%s\n",d,n,l,p) ;
}

END{

}
