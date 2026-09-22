autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-colors ''

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS

bindkey -e

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#626b7b'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[default]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[command]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[function]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#e7d5bd'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#5ea6bd'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#5ea6bd'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#8d97a6'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#8d97a6'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#8d97a6'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#8d97a6'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#d2ab72'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#d2ab72'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#d2ab72'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[path]='fg=#99bca2'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#99bca2'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#626b7b'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#626b7b'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#7897ce'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#626b7b'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#df8585,bold'

export EDITOR='nvim'
export VISUAL='nvim'
export LESS='-R'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"

if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then
    fastfetch -C examples/27
fi

