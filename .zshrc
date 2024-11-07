#work pls
autoload -Uz compinit promptinit
compinit
promptinit

setopt auto_cd

zstyle ':completion:*' menu select
export EDITOR=/usr/bin/hx

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
   #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ls='exa --group-directories-first'
alias la='exa --group-directories-first -a'
alias ll='exa --group-directories-first -l'
alias py='python3'
alias tree='tree -C'

alias cls='clear'
alias vim='/usr/bin/nvim'
alias chrome='chromium'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias space="ncdu"

PROMPT="
%(?.%F{magenta}::: %f.%F{red}%?%f) "
PS2="%F{red}::+ %f"
RPROMPT="%F{blue}%~%f"

export PATH="/home/derpyzza/.local/bin:$PATH"

source ~/.export.sh
