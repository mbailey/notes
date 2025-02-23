#!/bin/bash
# tailscale completion                                      -*- shell-script -*-
#
# https://gist.github.com/cmtsij/f0d0be209224a7bdd67592695e1427de

_tailscale()
{
	local cur prev words cword
	_init_completion -n = || return

	if [[ $cword -eq 1 ]]; then
		SUBCOMMANDS=$(tailscale --help 2>&1 | awk '/SUBCOMMANDS/{ f = 1; next } /FLAGS/{ f = 0 } f{print $1}')
		FLAGS="-h --help --socket"
		COMPREPLY=( $(compgen -W "$SUBCOMMANDS $FLAGS" -- "$cur" ))
		return
	else
		subcmd="${COMP_WORDS[1]}"
		if [[ "$cur" = *=* ]]; then
			COMPREPLY=( $(compgen -W 'false' -- "${cur#*=}") )
			return
		elif [[ "$cur" = -* ]]; then
			FLAGS=$(tailscale "$subcmd" --help 2>&1 | awk '/FLAGS/{ f = 1; next } f'  | grep -oE -- '--[^ ]+[=]?' | tr -d ',')
			FLAGS="$FLAGS --help"
			COMPREPLY=( $(compgen -W "$FLAGS" -- "$cur" ))
			return
		else
			case "$subcmd" in
				"ping")
				IP_AND_HOSTNAME=$(tailscale status 2>&1  | awk '{print $1"\n"$2}')
				COMPREPLY=( $(compgen -W "$IP_AND_HOSTNAME" -- "$cur" ))
				;;
			esac
		fi
	fi
}

(complete -p | grep -q tailscale) || \
	complete -F _tailscale tailscale
