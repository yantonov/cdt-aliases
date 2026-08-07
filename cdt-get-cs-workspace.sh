#!/bin/sh

set -eu

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Error: one or two arguments are required" >&2
    exit 1
fi

case "$1" in
    *" "*)
        if [ "$#" -ne 2 ] || [ -z "$2" ]; then
            echo "Error: first argument contains a space; second argument must provide the project name explicitly" >&2
            exit 1
        fi
        PROJECT_NAME="$2"
        ;;
    *)
        if [ "$#" -ne 1 ]; then
            echo "Error: exactly one argument is required when the project argument has no space" >&2
            exit 1
        fi
        # last "/"-separated token of $1, e.g. "team/proj" -> "proj"
        PROJECT_NAME="${1##*/}"
        ;;
esac

if [ -z "${WORKSPACE_HOME:-}" ]; then
    echo "Error: WORKSPACE_HOME is not set" >&2
    exit 1
fi

DEFAULT_WORKSPACE="$(basename \"$0\" | sed -E 's/([^.]+)(\..*)?/\1/')"
WORKSPACE="${PROJECT_NAME:-${DEFAULT_WORKSPACE}}"
TARGET="${WORKSPACE_HOME}/${WORKSPACE}"
mkdir -p "${TARGET}"
cd "${TARGET}"

cdt initcs

cdt cproj "$1"
