#
# OS Specific
#
switch (uname)
    case Darwin
        if not test -e /usr/local/bin/jenv
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
        alias j='j_darwin'
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
        alias j='j_linux'
    case '*'
        echo "config.fish: unsupported operating system"
end

#
# General
#
set -x CDPATH . ~ ~/data
if test -e $HOME/miniconda3/bin
    set miniconda_bin = $HOME/miniconda3/bin
	source $HOME/miniconda3/etc/fish/conf.d/conda.fish
end
if test -e $HOME/google-cloud-sdk/bin
    set gcloud_bin = $HOME/google-cloud-sdk/bin
end
set -x PATH $HOME/bin $miniconda_bin $gcloud_bin $ADD_JAVA_PATH /usr/local/bin $HOME/data/c0de/misc $PATH
set -x EDITOR (which vi)
#set -x PAGER (which vimpager)
set -x CLICOLOR 1
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled"
set -x GOPATH "/usr/local"

#
# IMC
#
set -x LOG_DIR {$HOME}/Work/log
set -x DEPLOYMENT_DIR {$HOME}/Work/deployment
set -x MAVEN_OPTS "-Xmx4096m"
set -x TAGID_DIR {$HOME}/data/tagid
#set -x http_proxy 'http://unixproxy:3128/'
#set -x https_proxy 'http://unixproxy:3128/'

#
# Git Aliases
#
alias gc='git clean -fdx'
alias gco='git checkout'
alias gci='git commit'
alias gb='git branch'
alias gpl='git pull --rebase'
alias gps='git push'
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
