#!/usr/bin/env bash
set -o errexit -o nounset

# Check if we're inside a git repository
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    # echo "Inside a Git repository."
    # git status
    ROOT_DIR=$(git rev-parse --show-toplevel)
    # echo "Git repo detected. Moving to root: $ROOT_DIR"
    cd "$ROOT_DIR" || exit 1
else
    echo "Not inside a Git repository."
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
