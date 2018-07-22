#!/bin/bash
# Add this script in /etc/rc.local to run automatically

GATEWAY=192.168.1.1
TIME_PING=5
TIME_POLL=300
DEVICE=wlan0
REBOOT_COUNT=3
LOG=/var/log/watchdog-net.log

function network-reconfigure {
	echo ${datetime}" watchdog reconfigure network" >> ${LOG}
	service network-manager stop
	ip link set ${DEVICE} down
	ip link set ${DEVICE} up
	service network-manager start
	return $?
}

function system-reboot {
	echo ${datetime}" watchdog reboot system" >> ${LOG}
	/sbin/shutdown -r "+1"
	return $?
}

datetime=$(date)
echo ${datetime}" watchdog start" >> ${LOG}

count=0
while [ 1 ]; do

	sleep ${TIME_POLL}

	ping -w ${TIME_PING} ${GATEWAY} &>/dev/null
	alive=$?

	if [ ${alive} -ne 0 ]; then

		datetime=$(date)

		if [ ${count} -lt ${REBOOT_COUNT} ]; then
			network-reconfigure
		else
			system-reboot
			break
		fi

		count=$((count+1))

	else
		count=0
	fi

done

echo ${datetime}" watchdog end" >> ${LOG}

exit 0
