#!/bin/bash

if [[ ! ${1} ]] || [[ ! ${2} ]]; then

	echo 'Usage: '`basename ${0}`' <symbol> <library directory>'
	exit 1
	
fi

symbol=${1}
library_dir=${2}

for lib in `find ${library_dir} -name "*.so*"`; do
	
	output=`nm -D ${lib} 2> /dev/null | grep -e "\s${symbol}"`

	if [[ ${output} ]] && [[ ${output} != *U* ]]; then
		echo 'Library: '${lib}
		echo -e '\t'${output}
	fi
done
