# proxy related
export all_proxy=socks5://127.0.0.1:1080
alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

# aliases related to coreutils
alias oo="nohup xdg-open . >/dev/null 2>&1"
alias copy="head -c -1 | xsel -ib"
alias ll="ls -l"
alias l="ls -l"

# aliases related to python
alias python="python3"
alias py="python3"
alias pip="pip3"

# meshlab related stuff
function meshlab {
    nohup /usr/bin/meshlab $1 >/dev/null 2>&1 &
}

# change into nth directory
function cdn {
    local file_name=$(ls | head -n $1 | tail -1)
    cd $file_name
}
alias cn="cdn"

export CLICOLOR=1

# editor in bash vi mode
set EDITOR=vim

# stuff related to bash prompt
export default_ps1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '

# disable trackpad
# xinput
# xinput | grep TouchPad | grep id
# xinput disable 11 (11 is the touchpad id)
# enable trackpad
# xinput enable 11 (11 is the touchpad id)
