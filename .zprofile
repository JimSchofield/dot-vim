# source ~/.bash_profile
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export TERM=xterm-256color

export EDITOR=$(which nvim)
export VISUAL=$(which nvim)

# GENERAL
alias ll="ls -la"
alias ip="curl icanhazip.com"
# this may change below <en8>
alias nip="ipconfig getifaddr en8"
alias c="clear"

# FZF
alias go='cd $(fd . $HOME --type d | fzf)'


# HTTP-SERVER
alias serve="http-server ."

# TERMINAL
alias cpwd='echo "cd \"`pwd`\"" > ~/.switch-dir'
alias goto='source ~/.switch-dir'

# GIT
alias gl="git pull"
alias gs="git status"
alias gp="git push"
alias gpp="git pull; git push"

# TASK (command line task list)
alias t="task"
alias tw="clear;task +work"
alias tc="clear;task"
alias tt="clear;task +TODAY"

# PROJECTS
alias project="cd project\ path/"
