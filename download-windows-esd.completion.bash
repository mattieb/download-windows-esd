#!/usr/bin/env bash

_download_windows_esd_completions() {
    script="${COMP_WORDS[0]}"

    case "${COMP_CWORD}" in
    1)
        COMPREPLY=($(compgen -W "download shasum url languages architectures editions" "${COMP_WORDS[1]}"))
        ;;

    2)
        case "${COMP_WORDS[1]}" in
        download|shasum|url|editions|architectures)
            IFS=$'\n'
            COMPREPLY=($(compgen -C "${script}"\ languages "${COMP_WORDS[2]}"))
            ;;
        esac
        ;;

    3)
        case "${COMP_WORDS[1]}" in
        download|shasum|url|architectures)
            IFS=$'\n'
            COMPREPLY=($(compgen -C "${script}"\ editions\ "${COMP_WORDS[2]}" "${COMP_WORDS[3]}")) 
            ;;
        esac
        ;;


    4)
        case "${COMP_WORDS[1]}" in
        download|shasum|url)
            IFS=$'\n'
            COMPREPLY=($(compgen -C "${script}"\ architectures\ "${COMP_WORDS[2]}"\ "${COMP_WORDS[3]}" "${COMP_WORDS[4]}")) 
            ;;
        esac
        ;;

    esac
}

complete -F _download_windows_esd_completions download-windows-esd

