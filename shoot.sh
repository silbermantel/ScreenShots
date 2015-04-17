#!/bin/bash

source /home/enop/bin/cfgparser.sh

cfg.parser "/home/enop/Profiles/.$1.enop"
cfg.section.firefox


function sleeptimer {
TICKLENGTH=5
let ticks=$1/$TICKLENGTH

i="0"

while [ $i -lt $ticks ]
do
sleep $TICKLENGTH
i=$[$i+1]
done

}




Xvfb :${XVFB_DISPLAY} -screen 0 ${XVFB_RES_WIDTH}x${XVFB_RES_HEIGHT}x24 +extension RANDR -noreset -nolisten tcp 2> /dev/null &
XVFB_PID=$!

while true
do
    # Remove parent lock to prevent error message "firefox has been shutdown unexpectly..."
    rm $FF_PROFILEDIR/.parentlock >/dev/null

#    echo "Running firefox -P $FF_PROFILE on $XVFB_DISPLAY "
    DISPLAY=:${XVFB_DISPLAY} firefox -P $FF_PROFILE -width $XVFB_RES_WIDTH -height $XVFB_RES_HEIGHT "$FF_URL" >/dev/null &
    FF_PID=$!


    echo "Waiting $FF_WAIT seconds before screenshot"
    sleeptimer $FF_WAIT

    echo "Taking screenshot. Please smile!"
    HAM_DATE=`date +"%Y-%m-%d_%H-%M-%S"`
    DISPLAY=:${XVFB_DISPLAY} import -window root -crop ${SCREENSHOT_WIDTH}x${SCREENSHOT_HEIGHT}+${SCREENSHOT_OFFSET_LEFT}+${SCREENSHOT_OFFSET_TOP} "/home/enop/ScreenShots/$FF_PROFILE-$HAM_DATE".png
    du -h /home/enop/ScreenShots/$FF_PROFILE-$HAM_DATE.png	
#    echo "Killing firefox on PID $FF_PID"
    kill $FF_PID

#    echo "Waiting $SCREENSHOT_INTERVAL for next screenshot"
    sleeptimer $SCREENSHOT_INTERVAL

done


echo "Killing XVFB on $XVFB_PID"
kill $XVFB_PID 

