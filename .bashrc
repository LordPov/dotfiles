# Check for an interactive session
[ -z "$PS1" ] && return

# Use bash-completion, if available
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

# Expand path variables on tab
shopt -s direxpand

unset HISTFILESIZE
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

# turn off flow control
stty -ixon

#=========================================================================
# Exports
#=========================================================================

export GOROOT="/usr/local/opt/go"
export GOPATH="/usr/local/opt/go"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${HOME}/bin:/usr/local/bin:${JAVA_HOME}/bin:${GOROOT}/bin:${PATH}
#export CDPATH=".:~:~/data"
unset CDPATH
#export PYTHONPATH="${HOME}/Library/Python/2.7/site-packages"
export M2_HOME="/usr/local/opt/maven/libexec"
export EDITOR=`which vim`
export BROWSER="/Applications/Google\ Chrome.app"
export CLICOLOR=1
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

#=========================================================================
# Prompt
#=========================================================================

# disabled due to liquidprompt
#job_status="\`if [ \$? = 0 ]; then echo \[\e[32m\]:\)\[\e[0m\]; else echo \[\e[31m\]:\(\[\e[0m\]; fi\`"
#uhp_status="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w"
#vcs_status="\[\033[0;35m\]\$(vcprompt)"
#bgj_status="\[\033[1;37m\]\`if [ \$(jobs | wc -l | tr -d ' ') -gt 0 ]; then echo '[jobs:\j] \[\e[0m\]'; fi\`"
#export PS1="${job_status} ${uhp_status} ${vcs_status}${bgj_status}\[\033[01;34m\]\$\[\033[00m\] "

source ${HOME}/.liquidpromptrc
if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
else
	. $(which liquidprompt)
fi

# Change the window title of X terminals 
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
        TITLE_PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
        ;;
    screen)
        TITLE_PROMPT_COMMAND='echo -ne "\033_${PWD/#$HOME/~}\033\\"'
        ;;
esac
export PROMPT_COMMAND="${PROMPT_COMMAND}; history -a; history -n; ${TITLE_PROMPT_COMMAND}"

#=========================================================================
# Aliases
#=========================================================================

if [ -f /usr/local/bin/gls ]; then
    alias ls="gls --color"
else
    alias ls="ls --color"
fi
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#=========================================================================
# IMC Stuff
#=========================================================================

#export JAVA_OPTIONS="-da:ca.odell.glazedlists.impl.adt.barcode2.SimpleTree"
export LOG_DIR=${HOME}/Work/log
export DEPLOYMENT_DIR=${HOME}/Work/deployment
export MAVEN_OPTS=-Xmx4096m
export TAGID_DIR=${HOME}/data/tagid
#export http_proxy='http://unixproxy:3128/'
#export https_proxy='http://unixproxy:3128/'

alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias mysql="/usr/local/mysql/bin/mysql"
alias kinit="kinit $USER"
alias gs="git status -sb"
alias gco="git checkout"
alias gb="git branch"
alias gci="git commit"
alias gpl="git pull"
alias gps="git push"
alias gwtc="git commit -m \"$(curl -s http://whatthecommit.com/index.txt)\""
alias mi="mvn install -DskipTests"
alias mci="mvn clean install -DskipTests"
alias mui="mvn -U install -DskipTests"
alias muci="mvn -U clean install -DskipTests"
alias midea="mvn idea:idea"
alias mdeps="mvn dependency:tree -Dverbose"
alias cdsd="cd $SYSTEM_DIR"
alias cdda="cd $DATA_DIR"
alias cddd="cd $DEPLOYMENT_DIR"
alias cdld="cd $LOG_DIR"
alias cdd="cd ~/data"
#alias clifup="rsync -avz --delete master_batch@magneto:/mnt/S/office/fortis/fortis-sheets/v4/2011.05 /home/lordpov"
alias remotessh="ssh -f admin@lordpov.com -R 2222:localhost:22 -N"
alias pushcode="rsync -avz --delete --exclude '*-full-system-image.tar.gz' --exclude target --exclude .svn --exclude '*.iws' --exclude '*.ipr' --exclude '*.iml' /Users/lordpov/data/kindle /Users/lordpov/.m2 lordpov.com:/share/Random"
alias pullcode="rsync -avz --delete --exclude target --exclude .svn --exclude '*.iws' --exclude '*.ipr' --exclude '*.iml' lordpov.com:/share/Random/kindle /Users/lordpov/data"
alias xstroop="Xnest -ac -query stroopwafel :1"
alias fixjroute="sudo route delete default 192.168.1.1 && sudo route add default 192.168.1.1"
alias rmidea="find . | egrep '\.idea$|\.ipr$|\.iws$|\.iml$' | xargs rm -rf"
alias rmimcjunk='rm -rf Logs.* Counters.* ConfigSummary.* HardwareSummary.* *.LoadDataInFile T\:\\'
alias colibri-clean="rm -rf build && find . -name 'Mock*' | xargs rm -rf && git checkout test/Driver/Cme/MockCmeOrderSession.hpp test/Driver/Cme/MockCmeOrderSession.cpp && ./make.sh"
alias colibri-xcode="rm -rf build-osx && mkdir build-osx && cd build-osx && cmake -DBUILD_TESTING=OFF -DENABLE_CODECOVERAGE=OFF -DCMAKE_BUILD_TYPE=Debug -DDEBUG_ENABLED=ON -GXcode /Users/bryan/data/colibri"
alias colibri-push="rsync -av --delete $HOME/data/colibri syoffc06:~/data/"
alias colibri-push-home="rsync -av --delete $HOME/data/colibri lordpov.com::~/"
#alias colibri-mnt="mount -t nfs -o rw syoffc06:/home/bryan/data /Users/bryan/syoffc06"

function psn () { ps ax | grep -v "grep --colour $@" | grep --colour $@ ; }
function grepj () { grep -r --include '*.java' $1 * ; }
function grepp () { grep -r --include pom.xml $1 * ; }
function grepc () { grep -r --include '*.cpp' --include '*.c' --include '*.h' --include '*.hpp' $1 * ; }
function fullpath () { echo `pwd`/$1 ; }
function psgrep () { ps axu | grep -v grep | grep "$@" -i --color=auto ; }
function fn () { find . -iname "*$@*" ; }
function reggrep() { 
    for jar in *.jar; do 
        for file in $(jar -tf $jar); do
            unzip -p $jar $file | grep -qi "$1" && echo "$jar: $file"
        done
    done | sort -u
}
