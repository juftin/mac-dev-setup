#!/bin/zsh

# Logging for Scripts
function log_event(){
  LOGGING_TIMESTAMP=$(date +"%F %T,000")
  if [[ ${1} == "info" ]]; then
    echo "${LOGGING_TIMESTAMP} [    INFO]: ${2}"
  elif [[ ${1} == "error" ]]; then
    echo "${LOGGING_TIMESTAMP} [   ERROR]: ${2}"
  elif [[ ${2} == "" ]]; then
    echo "${LOGGING_TIMESTAMP} [    INFO]: ${1}"
  else
    echo "${LOGGING_TIMESTAMP} [   ${1}]: ${2}"
  fi
}

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# SHELL INTERACTION ALIASES
alias g="git"
alias cls="clear"
alias c="clear"
alias ls="ls -G -a -F"
alias reload="source ~/.zsh_aliases"
alias new_alias="nano ~/.zsh_aliases"

# SOURCE THE STANDARD ZSH FILES
function sync() {
  log_event info "Syncing ZSH Configuration..."
  source ~/.zshrc
  source ~/zsh_aliases
  log_event info "ZSH Synced!"
}

# NOTIFICATIONS FOR WHEN SCRIPT FINISHES:
function notify() {
  NOTIFICATION_MESSAGE=${1:-Alert}
  NOTIFICATION_TITLE=${2:-Terminal Notification}
  NOTIFICATION_SCRIPT_PREFACE="osascript -e "
  NOTIFICATION_SCRIPT_SUFFIX='display notification "'${NOTIFICATION_MESSAGE}'" with title "'${NOTIFICATION_TITLE}'" sound name "Submarine"'
  NOTIFICATION_SCRIPT=${NOTIFICATION_SCRIPT_PREFACE}"'${NOTIFICATION_SCRIPT_SUFFIX}'"
  eval ${NOTIFICATION_SCRIPT}
}

# CHECKOUT A GIT BRANCH
function check() {
  git checkout $1
  log_event info "Working On Git Branch: ${1}"
}

# REMOVE LOCAL VERSIONS OF DELETED REMOTE BRANCHES
function git-remove-deleted() {
  git fetch -p
  for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
	   git branch -D $branch;
  done
}

# GIT STATUS - VERBOSE BY DEFAULT
alias status="git status --verbose --ahead-behind --branch --find-renames"
