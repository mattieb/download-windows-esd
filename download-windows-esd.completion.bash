#!/usr/bin/env bash

set -Eeuo pipefail -o posix

_download_windows_esd_completions() {
  script="${COMP_WORDS[0]}"

  case "${COMP_CWORD}" in
  1)
    mapfile -t COMPREPLY < <(compgen -W "download shasum url languages architectures editions" -- "${COMP_WORDS[1]}")
    ;;

  2)
    case "${COMP_WORDS[1]}" in
    download | shasum | url | editions | architectures)
      mapfile -t COMPREPLY < <(compgen -W "$(command -v "${script}") languages" -- "${COMP_WORDS[2]}")
      ;;
    esac
    ;;

  3)
    case "${COMP_WORDS[1]}" in
    download | shasum | url | architectures)
      mapfile -t COMPREPLY < <(compgen -W "$(command -v "${script}") editions ${COMP_WORDS[2]}" -- "${COMP_WORDS[3]}")
      ;;
    esac
    ;;

  4)
    case "${COMP_WORDS[1]}" in
    download | shasum | url)
      mapfile -t COMPREPLY < <(compgen -W "$(command -v "${script}") architectures" -- "${COMP_WORDS[2]}" "${COMP_WORDS[3]}" "${COMP_WORDS[4]}")
      ;;
    esac
    ;;

  esac
}

complete -F _download_windows_esd_completions download-windows-esd
