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

# Generate J Aliases
if [[ -f ~/generate_j_aliases.sh ]]; then
    . ~/generate_j_aliases.sh
fi
eval "$(jenv init -)"
