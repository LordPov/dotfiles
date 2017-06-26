[[ -f ~/.bashrc ]] && . ~/.bashrc

# Docker functions and aliases
dkmenv() {
    local machine="\$1"
    [ -z \${machine} ] && machine="imc"
    eval "\$(docker-machine env \${machine})"
}

alias dk='docker'
alias dkm='docker-machine'

export PATH="$HOME/miniconda3/bin:$PATH"

