# default Bash configuration

# set path to papers
export P=$HOME/Notes/papers

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# use Vim and terminator as terminal
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export TERMINAL=/usr/bin/terminator

# If not running interactively, don't do more
[[ $- != *i* ]] && return

# add colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias passold='PASSWORD_STORE_DIR=$HOME/.password-store-old/ pass'

# add vim to neovim shorcut
alias vim='nvim'

# extract DOI/arxiv ID and download BibTex of a PDF file
tobib() {
	if ! command -v xapers &> /dev/null
	then
		echo "Please install xapers for DOI and BibTex download"
		exit
	fi

	xapers source2bib "$(xapers scandoc $@ | head -n 1)"
}
	

# shorcut for weather
weather() {
	curl -4 http://wttr\.in/$1
}

# useful timer function
timer() {
    if test -z "$1"
    then
        echo "Please specify the date like 'timer now+20min'"
    elif test -z "$2"
    then
        echo "twmnc --content 'Timer has expired!' --aot --pos bottom_left --fs 50 --size 50" | at $1;
    else
        echo "twmnc --content $2 --aot --pos bottom_left --fs 50 --size 50" | at $1;
    fi
}

forever() {
	AMOUNT=$1
	shift
	while :
	do
		$@
		sleep $AMOUNT
	done
}


# shortcuts to download youtube tracks and channels
yt-track() {
	youtube-dl -i -o "%(title)s.%(ext)s" --extract-audio --no-overwrites "$1";
}

yt-chan() { 
	youtube-dl -i -o "%(title)s.%(ext)s" --extract-audio http://www.youtube.com/user/"$1"
}

function pomo() {
    arg1=$1
    shift
    args="$*"

    min=${arg1:?Example: pomo 15 Take a break}
    sec=$((min * 60))
    msg="${args:?Example: pomo 15 Take a break}"

    while true; do
        date '+%H:%M' && sleep "${sec:?}" && notify-send -u critical -t 0 -a pomo "${msg:?}" && sleep 300
    done
}

# use Vi mode for Bash
set -o vi
# use jk for exiting the insert mode
bind '"jk":vi-movement-mode'

jobscount() {
  local stopped=$(jobs -sp | wc -l)
  local running=$(jobs -rp | wc -l)
  ((running+stopped)) && echo -n "<${running}r/${stopped}s>"
}

# more colors and job count in prompt
PS1='\[\e[1;31m\]\u\[\e[m\] \[\e[1;36m\]$(jobscount)\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[1;0m\]'
