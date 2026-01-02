#!/usr/bin/env bash
set -o errexit -o nounset

cdt moab checkout "$@"

gw exec --threads=1 --cmd="${SHELL} install-hooks.sh"
