#!/bin/sh

set -eu

if [ "$#" -ne 1 ]; then
    echo "Error: exactly one project argument is required" >&2
    exit 1
fi

case "$1" in
    *" "*)
        echo "Error: only one project should be used here" >&2
        exit 1
        ;;
esac

if [ -z "${WORKSPACE_HOME:-}" ]; then
    echo "Error: WORKSPACE_HOME is not set" >&2
    exit 1
fi

DEFAULT_WORKSPACE="$(basename \"$0\" | sed -E 's/([^.]+)(\..*)?/\1/')"
# last "/"-separated token of $1, e.g. "team/proj" -> "proj"
PROJECT_NAME="${1##*/}"
WORKSPACE="${PROJECT_NAME:-${DEFAULT_WORKSPACE}}"
TARGET="${WORKSPACE_HOME}/${WORKSPACE}"
mkdir -p "${TARGET}"
cd "${TARGET}"

cdt initcs

cdt cproj "$1"
