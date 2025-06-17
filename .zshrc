# add homebrew init to .profile

# zprof
# zmodload zsh/zprof

# zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

setopt promptsubst

zinit wait lucid for \
    OMZL::git.zsh \
	OMZL::async_prompt.zsh \
    atload"unalias grv" \
    OMZP::git

zinit wait lucid for \
    atinit"zicompinit; zicdreplay"  \
    zdharma-continuum/fast-syntax-highlighting \
    OMZP::colored-man-pages

zinit snippet OMZL::async_prompt.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet https://github.com/UeidaNuima/dotfiles/blob/master/zsh-themes/robbyrussell.zsh-theme

zinit light zdharma-continuum/fast-syntax-highlighting

# fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
## enable fzf shell integration
source <(fzf --zsh)

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
    remote_url=$(git remote get-url origin)

    # Extract the domain, path (user/repo), and strip the .git suffix
    # Assumes format: git@<domain>:<path>.git
    domain=$(echo "$remote_url" | sed -E 's|git@([^:]+):.*|\1|')
    path=$(echo "$remote_url" | sed -E 's|git@[^:]+:([^\.]+)(\.git)?|\1|')

    # Output in https format
    echo "https://$domain/$path"
}


git-open-link() {
    open "$(git-get-link)"
}

alias gol=git-open-link

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# vim
alias vim=nvim

# mise
eval "$(mise activate zsh)"

# Load .zshrc.custom if it exists
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom

# zprof
# zprof
