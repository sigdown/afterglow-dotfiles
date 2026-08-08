# ~/.zshrc

autoload -Uz compinit
compinit

# history

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# plugins

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[path]='fg=#EBC99A'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#EBC99A'

eval "$(starship init zsh)"
