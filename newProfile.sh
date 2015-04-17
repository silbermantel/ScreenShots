#!/bin/bash
source /home/enop/bin/cfgparser.sh

cfg.parser "/home/enop/.enop"
cfg.section.general

NEWPROFILE=$(zenity --entry --text "name the Profile" --entry-text "sector001")


num=`ls -1 $profile |wc -l`
NEWPROFILEDIR=$profile/$num-$NEWPROFILE
firefox -CreateProfile "$NEWPROFILE $NEWPROFILEDIR"

echo "[firefox]">$profile/.$NEWPROFILE.enop
echo "FF_PROFILE=$NEWPROFILE">>$profile/.$NEWPROFILE.enop
echo "FF_PROFILEDIR=$NEWPROFILEDIR">>$profile/.$NEWPROFILE.enop

ANSWER=$(zenity --entry --text "" --entry-text "file:///home/enop/manual.txt")
firefox -P $NEWPROFILE $ANSWER
echo "FF_URL=\"$ANSWER\"">>$profile/.$NEWPROFILE.enop

echo "FF_WAIT=110">>$profile/.$NEWPROFILE.enop

echo "XVFB_RES_WIDTH=4200">>$profile/.$NEWPROFILE.enop
echo "XVFB_RES_HEIGHT=2500">>$profile/.$NEWPROFILE.enop
echo "XVFB_DISPLAY=2$num  ">>$profile/.$NEWPROFILE.enop

echo "SCREENSHOT_INTERVAL=10">>$profile/.$NEWPROFILE.enop
echo "SCREENSHOT_WIDTH=4096">>$profile/.$NEWPROFILE.enop
echo "SCREENSHOT_HEIGHT=2304">>$profile/.$NEWPROFILE.enop
echo "SCREENSHOT_OFFSET_LEFT=220">>$profile/.$NEWPROFILE.enop
echo "SCREENSHOT_OFFSET_TOP=220">>$profile/.$NEWPROFILE.enop










