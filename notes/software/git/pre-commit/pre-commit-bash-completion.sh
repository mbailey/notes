# bash completion for pre-commit                             -*- shell-script -*-

_generate_array_map() {
    local -n srcarr="$1" dstmap="$2"
    local i key
    dstmap=()
    for i in "${!srcarr[@]}"; do
        key="${srcarr[i]}"
        [[ -z ${dstmap["${key}"]+set} ]] && dstmap["${key}"]=${i} || dstmap["${key}"]+=,${i}
    done
}

_complete_command()
{
    _flags=FLAGS_${command/-/_}[@]
    _opts=OPTS_${command/-/_}[@]
    OPTS=( "${FLAGS_default[@]} ${OPTS_default[@]} ${!_flags}" "${!_opts}" )
    compgen -W "${OPTS[*]}" -- "$cur"
}

_pre_commit()
{
    local cur prev words cword split=false
    if type -t _init_completion >/dev/null; then
        _init_completion -n = || return
    else
        # manual initialization for older bash completion versions
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
    fi

    local COMMAND_LIST=(
        autoupdate
        clean
        gc
        init-templatedir
        install
        install-hooks
        migrate-config
        run
        sample-config
        try-repo
        uninstall
        help
    )

    local -A _command_list=()
    _generate_array_map COMMAND_LIST _command_list

    local TOPLEVEL_OPTIONS=(
        ${COMMAND_LIST[@]}
        -h --help
        -V --version
    )


    FLAGS_default=( -h --help )
    OPTS_default=( --color -c --config )

    FLAGS_autoupdate=( --bleeding-edge --freeze )
    OPTS_autoupdate=( --repo )

    FLAGS_init_templatedir=( --no-allow-missing-config )
    OPTS_init_templatedir=( -t --hook-type )
    HAS_POS_init_templatedir=2  # directory

    FLAGS_install=( -f --overwrite --install-hooks --allow-missing-config )
    OPTS_install=( -t --hook-type )

    FLAGS_run=( -v --verbose --show-diff-on-failure -a --all-files )
    # OPTS_run=( --color -c --files --hook-stage --remote-branch --local-branch --from-ref --to-ref --commit-msg-filename --remote-name --remote-url --checkout-type --is-squash-merge --rewrite-command)
    OPTS_run=( -c --config --color --files --hook-stage )
    HAS_POS_run=3  # hooks

    # OPTS_try_repo=( --files --hook-stage --remote-branch --from-ref --to-ref --commit-msg-filename --remote-name --remote-url --checkout-type --is-squash-merge )
    OPTS_try_repo=( --files --hook-stage)

    OPTS_uninstall=( -t --hook-type )

    local command=${COMP_WORDS[1]}
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}

    if [ $COMP_CWORD == 1 ] ; then
        NEW=("${COMMANDS[@]}" "${TOPLEVEL_OPTIONS[@]}")

        COMPREPLY=( $(compgen -W "${TOPLEVEL_OPTIONS[*]}" -- "$cur") )
    elif [ $COMP_CWORD -gt 1 ]; then

        if [ "$command" == "help" ]; then
            COMPREPLY=( $(compgen -W "${COMMAND_LIST[*]}" -- "$cur") )
            return
        fi

        case "$prev" in
            -c | --config)
                COMPREPLY=()
                _filedir
                return
                ;;
            --color)
                COMPREPLY=( $(compgen -W "auto always never" -- "$cur") )
                return
                ;;
        esac


        case "$command" in
            autoupdate)
                case "$prev" in
                    --repo)
                        COMPREPLY=()
                        _filedir -d
                        return
                        ;;
                esac
                ;;
            init-templatedir | install | uninstall)
                case "$prev" in
                    -t | --hook-type)
                        COMPREPLY=( $(compgen -W "pre-commit pre-merge-commit pre-push prepare-commit-msg commit-msg post-commit post-checkout post-merge" -- "$cur") )
                        return
                        ;;
                esac
                ;;
            run | try-repo)
                case "$prev" in
                    -c | --config)
                        COMPREPLY=()
                        _filedir
                        return
                        ;;
                    --color)
                        COMPREPLY=( $(compgen -W "auto always never" -- "$cur") )
                        return
                        ;;
                    --hook-stage)
                        COMPREPLY=( $(compgen -W "commit merge-commit prepare-commit-msg commit-msg post-commit manual post-checkout push post-merge post-rewrite" -- "$cur") )
                        return
                        ;;
                    *)
                        # Handle multiple files for --files
                        for (( c=$COMP_CWORD; c>1; c-- )); do
                            prev_arg=${COMP_WORDS[c]}
                            if [ -z "$prev_arg" ]; then
                                continue
                            fi

                            if [[ $prev_arg =~ ^- ]]; then
                                case "$prev_arg" in
                                    --files)
                                        COMPREPLY=()
                                        _filedir
                                        return
                                        ;;
                                    *)
                                        break
                                        ;;
                                esac
                            fi

                            if [[ -n "${_command_list["${prev_arg}"]+set}" ]]; then
                                # We hit one of pre-commit's sub-command (like 'run') -> exit
                                break
                            fi
                        done
                        ;;
                esac
                ;;
        esac

        var=HAS_POS_${command/-/_}
        has_pos=${!var-0}

        case "$has_pos" in
            1)
                COMPREPLY=()
                _filedir
                ;;
            2)
                COMPREPLY=()
                _filedir -d
                ;;
            3)
                if [[ $cur == -* ]]; then
                    COMPREPLY=( $(_complete_command) )
                else
                    for (( c=$COMP_CWORD; c>1; c-- )); do
                        prev_arg=${COMP_WORDS[c]}
                        if [ -z "$prev_arg" ]; then
                            continue
                        fi

                        if [[ $prev_arg =~ ^- ]]; then
                            case "$prev_arg" in
                                -c | --config)
                                    COMPREPLY=( $(compgen -W "$(pre_commit_hook_parser ${COMP_WORDS[c+1]})" -- "$cur") )
                                    return
                                    ;;
                                *)
                                    break
                                    ;;
                            esac
                        fi

                        if [[ -n "${_command_list["${prev_arg}"]+set}" ]]; then
                            # We hit one of pre-commit's sub-command (like 'run') -> exit
                            break
                        fi
                    done

                    if [[ -f "$PWD/.pre-commit-config.yaml" ]]; then
                        COMPREPLY=( $(compgen -W "$(pre_commit_hook_parser $PWD/.pre-commit-config.yaml)" -- "$cur") )
                    fi
                fi
                ;;
            *)
                COMPREPLY=( $(_complete_command) )
                ;;
        esac
    fi
}

complete -F _pre_commit pre-commit
