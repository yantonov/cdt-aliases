#!/bin/sh
set -eu

cdt moab checkout "$@"

gw exec --threads=1 --cmd="${SHELL} -c install-hooks.sh"
