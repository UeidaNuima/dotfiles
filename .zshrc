ANTIGEN_LOG=~/.log/antigen.log

# zprof
zmodload zsh/zprof

# antigen
source /opt/homebrew/share/antigen/antigen.zsh


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# zstyle ':omz:plugins:nvm' lazy yes

# antigen config
antigen use oh-my-zsh
antigen bundle git
# antigen bundle brew
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme UeidaNuima/dotfiles zsh-themes/robbyrussell

antigen apply


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# pnpm
# export PNPM_HOME="~/Library/pnpm"
# export PYTHON_HOME="$(brew --prefix python)/libexec/bin"
# export PATH="$PYTHON_HOME:$PNPM_HOME:$PATH"
# pnpm end


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git alias

gmm() {
  branch='master'
  if [ -n "$1" ]; then
    branch=$1
  fi
  git fetch origin $branch:$branch
  git merge $branch
}

git-get-link() {
  remote="$(git remote get-url origin)"
  remoteWithRightDomain=${remote/git@code.byted.org:/https:\/\/code.byted.org\/}
  echo ${remoteWithRightDomain/.git/}
}


git-open-link() {
  open "$(git-get-link)"
}

alias gol=git-open-link

[ -f "$HOME/.bytebm/config/config.sh" ] && . "$HOME/.bytebm/config/config.sh"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

eval $(thefuck --alias)


# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# vim
alias vim=nvim

# console ninja
PATH=~/.console-ninja/.bin:$PATH

# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# mise
eval "$(mise activate zsh)"

export PATH="~/.local/bin:$PATH"

# zprof
zprof
