#!/bin/bash
source /home/enop/bin/cfgparser.sh
KNOWNPROFILES=""

for f in `ls -1 /home/enop/Profiles`
do
KNOWNPROFILES="$KNOWNPROFILES FALSE `echo $f|cut -d '-' -f 2 `"
done

ACTIVEPROFILE=$(zenity --list --text "choose profiles to record" --radiolist --column "record" --column "profile" $KNOWNPROFILES --separator="\n" )


/home/enop/bin/shoot.sh $ACTIVEPROFILE




