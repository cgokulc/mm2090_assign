#!/usr/bin/bash
num18=$(egrep -c ^..18... RollList.csv)
num19=$(egrep -c ^..19... RollList.csv)
fee17=20000
fee18=$(echo 1.1*$fee17|bc)
fee19=$(echo 1.1*$fee18|bc)
tot18=$(echo $num18*$fee18|bc)
tot19=$(echo $num19*$fee19|bc)
tot=$(echo $tot18+$tot19|bc)
echo $tot
