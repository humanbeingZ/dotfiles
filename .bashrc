# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Jing 
function cdn() {
	# change into nth directory
	local filename=$(ls | head -n $1 | tail -1)
	cd $filename
}

# added by Jing
function meshlab() {
  # use nohup and /dev/null
  dir=`dirname "$1"`
  file=`basename "$1"`
  cd $dir
  nohup /usr/bin/meshlab $file >/dev/null 2>&1 &
  cd - >/dev/null
  # nohup /usr/bin/meshlab $1 >/dev/null 2>&1 &
}

# added by Jing
function compile() {
  # use g++ to compile c++ code
  name=`basename "$1" .cpp`
  /usr/bin/g++ $1 -lCGAL -lCGAL_Core -lopencv_core -lopencv_imgcodecs -lopencv_highgui -lpcl_io -lpcl_common -lpcl_features -lpcl_sample_consensus -lpcl_octree -lpcl_segmentation -lpcl_kdtree -lpcl_search -lboost_system -lboost_thread -lgmp -lgmpxx -lmpfr -std=c++11 -o ${2:-$name.out} -O3
}

function up() {
    # change into nth parent directory
    # up 1 <==> cd ../
    # up 2 <==> cd ../../
    # up 3 <==> cd ../../../
    # etc.
    for i in `seq 1 $1`; do 
        cd ../;
    done
}

function rcl() {
	# Rsync Copy to Local
	rsync -avzp 10.26.23.13::zhaojing016$1 ${2:-./}
}

function rcl3() {
	# Rsync Copy to Local
	rsync -avzp 10.26.23.3::zhaojing016$1 ${2:-./}
}

function rcr() {
	# Rsync Copy to Remote
	local filename=$(pwd)/$1
	rsync -avzP $filename 10.26.23.13::zhaojing016${2:-/home/zhaojing016/download/}
}

function rcr3() {
	# Rsync Copy to Remote
	local filename=$(pwd)/$1
	rsync -avzP $filename 10.26.23.3::zhaojing016${2:-/data0/zhaojing016/downloads/}
}

# added by Anaconda3 installer
export PATH="/home/zhaojing016/anaconda3/bin:$PATH"
export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
export PATH="/home/zhaojing016/torch/install/bin/torch-activate:$PATH"
. /home/zhaojing016/torch/install/bin/torch-activate

# added by Jing to set gurobi related stuff
export GUROBI_HOME="/opt/gurobi811/linux64"

# added by Jing to set proxy
export all_proxy=socks5://10.4.4.13:1094

# added by Jing to set bash to vi mode
set -o vi
export EDITOR=vim
# bind '"jj":vi-movement-mode'
# bind 'set show-mode-in-prompt on'
# bind 'set vi-cmd-mode-string \1\e[2 q\2'
# bind 'set vi-ins-mode-string \1\e[5 q\2'

# bind -m vi-command "\C-e":end-of-line
# bind -m vi-command "\C-a":beginning-of-line
# bind -m vi-command "\C-l":clear-screen
# 
# bind -m vi-insert "\C-e":end-of-line
# bind -m vi-insert "\C-a":beginning-of-line
# bind -m vi-insert "\C-l":clear-screen

# bind -m vi-command "v": ""

# stuff related to bash prompt
export default_ps1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '

# history with date info
export HISTTIMEFORMAT="%d/%m/%y %T "
