#!/usr/bin/env bash
set -o errexit -o nounset

# https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v install-ticket-commit-msg-hook.sh &> /dev/null
then
    install-ticket-commit-msg-hook.sh --force
else
    echo 'ticket commit message hook is missing'
    echo 'check https://github.com/yantonov/ticket-commit-msg to install'
fi

# https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v ticket-commit-msg &> /dev/null
then
    git config custom.ticketnumberprefix 'JIRA: '
else
    echo 'ticket commit message tool is missing'
    echo 'check https://github.com/yantonov/ticket-commit-msg to install'
fi
