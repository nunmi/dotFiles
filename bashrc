#. .profile

PROMPT_COMMAND='PS1="`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[0;35m\]\u\[\e[0;35m\]@\h \$\[\e[0m\] "'

# Exports
export TERM=xterm-256color
export replace=$HOME/Desktop/stuff/scripts/utils/replace.sh

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lat'
alias mg='f_cgrep $1'
alias ng='f_ngrep $1'
alias akill='f_akill $1'
alias avim='$GVIM_BIN -v'
alias nvim='$GVIM_BIN -u NONE'
alias afind='find . -name ${1}'
alias aterm='terminator -T ${1} > /dev/null 2>&1 '
alias vr='gvim --servername GVIM --remote-tab'
alias aping='ping $1 | while read pong; do echo "$(date): $pong"; done'
alias adesk='rdesktop -x 0x80 -g 1900x1000 $1'


# Functions
function f_akill() {
	echo "`ps -ef | grep -v grep | grep \"$1\" | awk '{ print $2 }' | xargs kill -9`"
}

function f_cgrep() {
	echo "`find \( -name "*.c" -o -name "*.cpp" -o -name "*.h*" -o -name "*.java" \) | xargs grep -nir \"$1\"`"
}

function f_ngrep() {
	echo "`grep -nir \"$1\" *`"
}
