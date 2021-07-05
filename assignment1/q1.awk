#!/usr/bin/gawk -f
BEGIN{
tot=0;
FS=",";
fee17=20000;
fee18=(1.1)*fee17;
fee19=(1.1)*fee18;
print "------Fee Calculator------";
}

{
 r=$1;
 if(r ~ /^..18/) tot+=fee18;
 if(r ~ /^..19/) tot+=fee19;
}

END{
 print tot;
}
