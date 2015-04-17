#!/bin/bash
source /home/enop/bin/cfgparser.sh

PROFILE=unknown

function showHelp {
echo "help"
	exit 0
			}

while getopts hp: opt
	do
		case $opt in
		p) PROFILE=$OPTARG;terminology -e /home/enop/bin/shoot.sh &;;
    		h) showHelp;exit;;
		*) exit 1;;
		esac
done

echo "ende"