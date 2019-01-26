# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# all stuff below this line are added by Jing
# proxy related
export all_proxy=socks5://127.0.0.1:1080
alias proxy='export all_proxy=socks5://127.0.0.1:1080'
alias unproxy='unset all_proxy'

# aliases related to coreutils
alias readlink="greadlink"
alias copy="ghead -c -1 | pbcopy"
alias ll="ls -l"
alias l="ls -l"

# aliases related to other tools
alias marp="/Applications/Marp.app/Contents/MacOS/Marp"

# aliases related to python
alias python="python3"
alias py="python3"
alias pip="pip3"

# auto complete related 
# see: https://apple.stackexchange.com/questions/82288/after-typing-sudo-i-can-no-longer-autocomplete-commands-by-pressing-tab
complete -cf man
complete -cf help
complete -cf sudo 

# meshlab related stuff
function meshlab {
    nohup /Applications/meshlab.app/Contents/MacOS/meshlab $1 </dev/null >/dev/null 2>&1 &
}

export CLICOLOR=1
