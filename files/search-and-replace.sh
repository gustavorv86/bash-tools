
search_and_replace() {
	if [[ ${#} -ne 3 ]]; then
	
		echomsg 'ERROR: invalid parameters'
		
		return 1
	fi
	
	local search=${1}
	local replace=${2}
	local file=${3}

	sed -i -e 's|'${search}'|'${replace}'|g' ${file}
	return 0
}
