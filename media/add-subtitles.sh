#!/bin/bash

if [[ ${#} -ne 3 ]]; then
   echo 'Usage: '`basename ${0}`' <video input> <subtitles> <video output>'
   exit 1
fi

MENCODER=`command -v mencoder`

echo 'Video input:  '${1}
echo 'Subtitles:    '${2}
echo 'Video output: '${3}
echo

${MENCODER} -ovc copy -oac copy -sub ${2} -subcp iso-8859-1 -subfont-text-scale 3 -o ${3} ${1}
