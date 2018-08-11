
search_and_replace() {
	local SCAPE_CHAR='#'
	
	if [[ ${#} -ne 3 ]]; then
	
		echo 'ERROR: invalid parameters'
		return 1
		
	fi
	
	local search=${1}
	local replace=${2}
	local file=${3}

	sed -i -e 's'${SCAPE_CHAR}${search}${SCAPE_CHAR}${replace}${SCAPE_CHAR}'g' ${file}
	return 0
}
