# default Bash configuration

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi

# use Vim and terminator as terminal
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator

# set path to papers
export P=$HOME/Notes/content/arbeitsbuch/papers/

# add colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

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

function forever() {
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

# use Vi mode for Bash
set -o vi

jobscount() {
  local stopped=$(jobs -sp | wc -l)
  local running=$(jobs -rp | wc -l)
  ((running+stopped)) && echo -n "<${running}r/${stopped}s>"
}

# more colors and job count in prompt
PS1='\[\e[1;31m\]\u\[\e[m\] \[\e[1;36m\]$(jobscount)\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[1;0m\]'
