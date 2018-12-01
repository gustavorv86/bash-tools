#!/bin/bash

mount_all() {

	list_devs=`ls /dev/sd*`
	for dev in ${list_devs}; do

		if [[ ${dev} == *[0-9] && ${dev} != /dev/sda* ]]; then

			mount_out=`mount | grep ${dev}`

			if [[ ! ${mount_out} ]]; then
				mount_dir='/media/'`basename ${dev}`
				mkdir -p ${mount_dir}

				echo 'Device: '${dev}
				echo 'Mount out: '${mount_out}
				echo 'Mount dir: '${mount_dir}

				mount -t auto ${dev} ${mount_dir}
			fi
		fi

	done
}

execroot() {

	if [[ ${UID} -eq 0 ]]; then
		${@}
	else

		if [[ ${USE_SUDO} && ${USE_SUDO} == "true" ]]; then
			sudo bash -c "`declare -f ${1}`; ${@}"
		else
			su -c "`declare -f ${1}`; ${@}"
		fi
	fi

}

USE_SUDO="true"

execroot mount_all

echo 'Done'
