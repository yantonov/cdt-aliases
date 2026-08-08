#!/bin/sh
set -eu

cdt moab checkout "$@"

cdt exec ${SHELL} -- -c install-hooks.sh
