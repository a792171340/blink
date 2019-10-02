#!/usr/bin/env bash
HAPP_PATH=""
printHelp() {
    printf "Usage:\n"
    printf "sh ipes.sh [command]\n"
    printf "Available Commands:\n"
    printf " -p path : cache path\n"
    printf " -h      : show this help\n"
    exit 0
}

while [ -n "$1" ]
do
	case "$1" in
		-p)HAPP_PATH=$2
           shift ;;
		-h)printHelp
		    ;;
		*)printf "Error: unspport param!\n\n"; printHelp
		    ;;
	esac
	shift
done

if [ x"$HAPP_PATH" != "x" ]
then {
	echo "======== installing ========"
	wget -qO- http://ipes-tus.iqiyi.com/update/ipes-linux-x86_64-eb491a21-llc.tar.gz | tar zxf - -C /
	
	mkdir -p /ipes/var/db/ipes/happ-conf
	echo "args:" > /ipes/var/db/ipes/happ-conf/custom.yml
	echo "  - '$HAPP_PATH'" >> /ipes/var/db/ipes/happ-conf/custom.yml

	echo "======== starting   ========"
	/ipes/bin/ipes start

	echo "========    done    ========"
}
else {
	printHelp
}
fi
