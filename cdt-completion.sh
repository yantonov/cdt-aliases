#!/usr/bin/env sh
set -eu

USAGE="usage: $(basename "$0") show|install"

if [ "$#" -ne 1 ]; then
    echo "Error: exactly one argument is required" >&2
    echo "${USAGE}" >&2
    exit 1
fi

case "$1" in
    show|install) ACTION="$1" ;;
    *)
        echo "Error: unknown subcommand: $1" >&2
        echo "${USAGE}" >&2
        exit 1
        ;;
esac

if [ -z "${SHELL:-}" ]; then
    echo "Error: SHELL is not set, cannot detect the current shell" >&2
    exit 1
fi

CURRENT_SHELL="$(basename "${SHELL}")"
# on windows msys converts SHELL for the native alias binary,
# so the value we get here is /usr/bin/bash.exe instead of /usr/bin/bash
CURRENT_SHELL="${CURRENT_SHELL%.exe}"

case "${CURRENT_SHELL}" in
    bash)
        TARGET="${HOME}/.local/share/bash-completion/completions/cdt"
        ;;
    *)
        echo "Error: completion is not supported for the current shell: ${CURRENT_SHELL}" >&2
        echo "supported shells: bash" >&2
        exit 1
        ;;
esac

SOURCE="$(dirname "$0")/completion/${CURRENT_SHELL}/cdt"

if [ ! -f "${SOURCE}" ]; then
    echo "Error: completion script is missing: ${SOURCE}" >&2
    exit 1
fi

case "${ACTION}" in
    show)
        cat "${SOURCE}"
        ;;
    install)
        mkdir -p "$(dirname "${TARGET}")"
        # target may be a symlink, replace it instead of writing through it
        rm -f "${TARGET}"
        cp "${SOURCE}" "${TARGET}"
        echo "${CURRENT_SHELL} completion is installed to ${TARGET}"
        echo "start a new shell or run: . \"${TARGET}\""
        ;;
esac
