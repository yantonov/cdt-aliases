#!/bin/sh

set -eu

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Error: one or two arguments are required" >&2
    exit 1
fi

if [ "$#" -eq 2 ] && [ -n "$2" ]; then
    PROJECT_NAME="$2"
else
    case "$1" in
        *" "*)
            echo "Error: first argument contains a space; second argument must provide the project name explicitly" >&2
            exit 1
            ;;
        *)
            # last "/"-separated token of $1, e.g. "team/proj" -> "proj"
            PROJECT_NAME="${1##*/}"
            ;;
    esac
fi

if [ -z "${WORKSPACE_HOME:-}" ]; then
    echo "Error: WORKSPACE_HOME is not set" >&2
    exit 1
fi

DEFAULT_WORKSPACE="$(basename \"$0\" | sed -E 's/([^.]+)(\..*)?/\1/')"
WORKSPACE="${PROJECT_NAME:-${DEFAULT_WORKSPACE}}"
TARGET="${WORKSPACE_HOME}/${WORKSPACE}"
mkdir -p "${TARGET}"
cd "${TARGET}"

cdt initj

case "$1" in
    *" "*)
        set -f
        set -- $1
        set +f
        cdt cproj "$@"
        ;;
    *)
        cdt cproj "$1"
        ;;
esac
