#!/bin/bash

# Path to delete...
RM_PATH="/home/gustavorv86"

# except this files and folders
RM_WHITELIST=".bashrc .config/xfce4 .config/mimeapps.list Desktop Documents Images Music Arduino EclipseWorkspace NetBeansProjects"

rm_whitelist() {
	local TMP_BAK="/tmp/.bak"
	local rm_path=${1}
	shift
	local whitelist=${@}

	## Create backup
	mkdir -p ${TMP_BAK}
	rm -rf ${TMP_BAK}"/*"

	for file in ${whitelist}; do
		
		local filename=${rm_path}"/"${file}
		
		if [[ -f ${filename} ]] || [[ -d ${filename} ]]; then
			local parentdir=$(dirname ${filename})
			mkdir -p ${TMP_BAK}"/"${parentdir}
			cp -r ${filename} ${TMP_BAK}"/"${parentdir}
		fi
		
	done

	## Delete all files
	rm -rf ${rm_path}/*
	
	## Restore backup 
	cp -r ${TMP_BAK}/* /
}

# Execute function
rm_whitelist ${RM_PATH} ${RM_WHITELIST}
