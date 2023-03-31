#!/usr/bin/env bash
set -o errexit -o nounset

PROJECTS="$1"

cdt moab checkout "${PROJECTS}"

gw exec --threads=1 --cmd="${SHELL} install-hooks.sh"
