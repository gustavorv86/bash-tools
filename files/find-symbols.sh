#!/bin/bash

SCRIPT=`basename ${0}`

print_help() {
	echo 'Usage: '${SCRIPT}' DIRECTORY SYMBOL_NAME'
	exit 1
}

function_search() {
	if [[ ! ${1} ]] || [[ ! ${2} ]]; then
		return 10
	fi

	local directory=${1}
	local symbolname=${2}

	if [[ ! -d ${directory} ]]; then
		return 11
	fi

	local libraries=`find ${directory} -type f -name "*.so*"`

	for lib in ${libraries}; do
		local output=`nm -D ${lib} 2> /dev/null | grep -ve "\sU" | grep -e "\s${symbolname}"`
		if [[ ${output} ]]; then
			echo 'Library: '${lib}
			echo -e '\t'${output}
		fi
	done
	return 0
}

function_search ${@}

if [[ ${?} -ne 0 ]]; then
	print_help
fi
