if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

PS1='\[\e[1;31m\]\u@\h\[\e[m\] \[\e[1;36m\]$(jobscount)\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[1;0m\]'

alias vim=nvim

# use Vim and terminator as terminal
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export TERMINAL=/usr/bin/terminator
export PATH=$HOME/.local/scripts:$PATH

# faster git access
alias g=git\ log
alias gi="git"

source /usr/share/bash-completion/completions/git
__git_complete g __git_main
__git_complete gi __git_main

# use Vi mode for Bash
set -o vi
# use jk for exiting the insert mode
bind '"jk":vi-movement-mode'

jobscount() {
  local stopped=$(jobs -sp | wc -l)
  local running=$(jobs -rp | wc -l)
  ((running+stopped)) && echo -n "<${running}r/${stopped}s>"
}

weather() {
	curl -4 http://wttr\.in/$1
}
