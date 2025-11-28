#!/usr/bin/env bash
set -o errexit -o nounset

# Check if current directory is a Git repo by looking for .git
if [ ! -d .git ]; then
    echo "Error: This is not a Git repository."
    exit 1
fi

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
