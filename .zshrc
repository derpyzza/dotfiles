#work pls
autoload -Uz compinit promptinit
compinit
promptinit

setopt auto_cd

zstyle ':completion:*' menu select
export EDITOR=/usr/bin/neovim
export terminal=alacritty

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

build()
{
   make
   printf "\033[1;32mBuild Output:\033[m\n"
   ./bin/* $@
}

pinit ()
{
   hdir="$1"
   mkdir $hdir $hdir/src $hdir/bin $hdir/libs
}

color () 
{
	printf "\033[31m"
}

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
alias lgit='exa --git-ignore --group-directories-first'
alias ze='vim ~/.zshrc'
alias py='python3'
alias tree='tree -C'

alias cls='clear'
alias vim='/usr/bin/neovim'
alias chrome='chromium'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias space="ncdu"

PROMPT="
%(?.%F{magenta}%f.%F{blue} {%?}%f) "
PS2="%F{red}λ%f"
RPROMPT="%F{#999}%~%f"

# %(?. .%F{red} {%?}%f)

#eval source <(/usr/local/bin/starship init zsh --print-full-init)
#export STARSHIP_CONFIG=~/.config/starship/starship.toml

export PATH="$PATH:/home/derpyzza/flutter/flutter/bin"
export PATH="$PATH:/home/derpyzza/Downloads/android-studio/bin"
export PATH="$PATH:/home/derpyzza/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:/home/derpyzza/butler"
export PATH="$PATH:/home/derpyzza/Downloads/ideaIDE/bin/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
