#!/bin/bash

if [[ ! ${1} ]]; then
	echo "USAGE: "`basename ${0}`" <source directory>"
	exit 1
fi

if [[ ! -d ${1} ]]; then
	echo "ERROR: Directory ${1} not found."
	exit 2
fi

source_files=`find ${1} -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.h" -o -name "*.hh" -o -name "*.hpp" -o -name "*.java" -o -name "*.py"`

for f in ${source_files}; do
	echo "File ${f}..."
	sed -i 's/    /\t/g' ${f}
done

