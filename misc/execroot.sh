#!/bin/bash

# Execute commands or functions as root

USE_SUDO='true'
execroot() {

	if [[ ${UID} -eq 0 ]]; then
		${@}
	else

		if [[ ${USE_SUDO} && ${USE_SUDO} == 'true' ]]; then
			sudo bash -c "`declare -f ${1}`; ${@}"
		else
			su -c "`declare -f ${1}`; ${@}"
		fi
	fi

}

#### Example ####

check_user() {
	echo 'User: '${USER}' UID: '${UID}
}

check_user

execroot check_user
