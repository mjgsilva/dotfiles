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
# plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="/Users/mario/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
function ignoreio() { curl -L -s https://www.gitignore.io/api/$@ ;}
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source /Users/mario/.dvm/dvm.sh
export EDITOR='nvim'

# Docker
alias 'dstart=eval "$(docker-machine env default)"'
alias 'dstop=docker rm "$(docker ps -a -q)"'
alias 'dps=docker ps -a'
alias 'dld=docker images -q -f dangling=true'
alias 'dkill=docker kill "$(docker ps -q)"'
alias 'drd=docker rmi "$(docker images -q -f dangling=true)"'
alias 'dra=docker rmi "$(docker images -q)"'
# NeoVim alias
alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
# Npm installer w/o progress bar
alias npmi='npm set progress=false && npm install'
# Postgres
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
# Git alias 
alias gs='git status'
alias gap='git add -p'
alias gaa='git add -A'
alias gp='git push'
alias gpf='git push -f'
alias gpp='git pull'
alias gst='git stash -u'
alias gsa='git stash apply'
alias grm='git rebase master -i'
alias grc='git rebase --continue'
alias gca='git commit --amend'
alias gcm='git checkout master'
function gcmm() { git commit -m "$@" }
function gcb() { git checkout -b "$@" }
function gc() { git checkout "$@" }

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
