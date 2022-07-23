#!/bin/bash

# notes.sh - edit notes
#
# - check multiple dirs (e.g. different projects)
# - tab completion

# Provide one or mote directories for notes
#
# NOTES_DIRS="${HOME}/Documents/notes-public:${HOME}/Documents/notes-work:${HOME}/Documents/notes-personal"

alias n='notes'

function notes(){
  [[ -n $1 ]] || return
  local filename="${1}.md"
  local notes_dir
  for notes_dir in ${NOTES_DIRS//:/ }; do
    if [[ -f "${notes_dir}/${filename}" ]]; then
      vi "${notes_dir}/${filename}"
      return
    fi
  done
  local regex_yes="^[Yy]$"
  read -p "Not found! Create file (${notes_dir}/${filename}) ?" -n 1 -r
  echo
  if [[ $REPLY =~ $regex_yes ]]; then
   printf "# ${filename/.md}\n\n\n"  >> "${notes_dir}/${filename}"
   vi +3 "${notes_dir}/${filename}"
  fi
}

# bash_completion
_notes_completion() {
  local command="$filename"
  local word="$2"
  local options
  options=$(
    ls ${NOTES_DIRS//:/ } 2>/dev/null |
    grep -v ':' |
    grep '.md$' |
    sed 's/.md$//g' |
    sort -u |
    awk '{ print $1 }')
  COMPREPLY=($(compgen -W "${options}" -- ${word}))
  return 0
}

complete -F _notes_completion notes
complete -F _notes_completion n
# COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
