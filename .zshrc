# Path to your oh-my-zsh installation.
export ZSH=/Users/mario/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="smtMJ"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# NeoVim alias
alias v='env LANG=en_GB.UTF-8 nvim'
# Postgres
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# Git alias
alias gs='git status'
alias gap='git add -p'
alias gaa='git add -A'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpff='git push -f'
alias gpp='git pull'
alias gst='git stash -u'
alias gsa='git stash apply'
alias grm='git rebase master -i'
alias grc='git rebase --continue'
alias gca='git commit --amend'
alias gcm="git checkout $(git_main_branch)"
function gsut() { git branch --set-upstream-to=origin/"$@" "$@" }
function gcmm() { git commit -m "$@" }
function gcb() { git checkout -b "$@" }
unalias gc
function gc() { git checkout "$@" }
compdef _git gc=git-checkout
function gbd() { git branch -D "$@" }
compdef _git gbd=git-branch

function nuke() {
  git fetch
  git reset --hard origin/"$@"
}
compdef _git nuke=git-branch

function rbs() {
  local my_branch="$(git rev-parse --abbrev-ref HEAD)"
  git checkout $(git_main_branch)
  git pull
  git checkout $my_branch
  git rebase $(git_main_branch) -i
}

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,.DS_Store}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Tmuxinator
function mux() { tmuxinator "$@" }
alias to='mux "$(ls -t ~/Documents/Projects | fzf --layout=reverse)"'
alias ta='tmux attach -t "$(tmux ls -F "#S" | fzf --layout=reverse)"'
alias ts='tmux ls'
function tat() { tmux attach-session -t "$@" }

export GPG_TTY=$(tty)

. /usr/local/opt/asdf/libexec/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
