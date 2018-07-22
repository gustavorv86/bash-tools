#!/bin/bash

line_exists() {
	if [[ ${#} -ne 2 ]]; then
		
		echomsg 'ERROR: invalid parameters'
		
		return 2
	fi
	
	local line=${1}
	local file=${2}

	if [[ ! -f ${file} ]]; then 
		return 2
	fi

	grep -Fq ${line} ${file}

	# 0: Found, 1: Not found
	return ${?}
}
