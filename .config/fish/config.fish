#
# OS Specific
#
switch (uname)
    case Darwin
        if not test -e ~/.jabba
            set -x JAVA_HOME (/usr/libexec/java_home)
            set ADD_JAVA_PATH = $JAVA_HOME/bin
        end
        set -x M2_HOME "/usr/local/opt/maven/libexec"
        set -x BROWSER "/Applications/Google\ Chrome.app"
        if test -e /usr/local/bin/src-hilite-lesspipe.sh
            set -x LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
            set -x LESS ' -R '
        end
        set -x DYLD_FALLBACK_LIBRARY_PATH $HOME/miniconda3/lib $DYLD_FALLBACK_LIBRARY_PATH
        alias m-cli='/usr/local/m-cli/m'
    case Linux
        set -x BROWSER (which links)
        set -x M2_HOME "/usr/share/maven"
        switch (lsb_release -i | cut -c 17-)
            case Arch
                if test -e /usr/lib/jvm/java-8-openjdk/jre
                    set -x JAVA_HOME "/usr/lib/jvm/java-8-openjdk/jre"
                end
            case Fedora
                set -x JAVA_HOME "/opt/imc/oracle-jdk-1.7.0_u11"
            case '*'
                echo "config.fish: unsupported distro"
        end
        set ADD_JAVA_PATH = $JAVA_HOME/bin
    case '*'
        echo "config.fish: unsupported operating system"
end

#
# General
#
if test -e $HOME/edge
    set edge_path = $HOME/edge
    set -x EDGE_TEMPLATES $HOME/edge/templates
end
set -x CDPATH . $edge_path ~/code
if test -e $HOME/miniconda3/bin
    set miniconda_bin = $HOME/miniconda3/bin
	source $HOME/miniconda3/etc/fish/conf.d/conda.fish
end
if test -e $HOME/code/c0de
    set c0de_misc_path = $HOME/code/c0de/misc
end
set -x PATH $HOME/bin $miniconda_bin $ADD_JAVA_PATH /usr/local/bin $c0de_misc_path $HOME/.cargo/bin $PATH
set -x EDITOR (which vi)
#set -x PAGER (which vimpager)
set -x CLICOLOR 1
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled"
set -x GOPATH "/usr/local"
set -x MAVEN_OPTS "-Xmx4096m"

#
# Git Aliases
#
alias gc='git clean -fdx'
alias gco='git checkout'
alias gci='git commit'
alias gb='git branch'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpls='git pull --rebase && git push'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log'
alias gsl='git shortlog'
alias gwtf='git-wtf'
alias gup='git-reup'

#
# Docker Aliases
#
alias dk='docker'
alias dkm='docker-machine'

#
# Other Aliases
#
alias dog='pygmentize'
alias vi='vim'
alias sa='screen -r'

#source /Users/bryan/.iterm2_shell_integration.fish

[ -s "/Users/rendo/.jabba/jabba.fish" ]; and source "/Users/rendo/.jabba/jabba.fish"
