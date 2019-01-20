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
