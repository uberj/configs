# Local vars
source ~/.zsh_vars

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="eastwood"

plugins=(git)

export EDITOR=vim
export SVN_EDITOR=$EDITOR

# git settings

source $ZSH/oh-my-zsh.sh

#source /usr/bin/virtualenvwrapper.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/local/texlive/2013/bin/x86_64-linux:$HOME/.opam/system/bin

# Go crap
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *.rar)        unrar $1    ;;
            *.jar)        jar xf $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
setxkbmap -option ctrl:nocaps
alias irc="ssh -t $IRC_HOST screen -rdU 7175.irc"

bounce () {
	# $1 = file to bouunce
	# $2 = jump host
	# $3 = target host
	if [ ! -z $JUMP_HOST ]; then
		echo "scp $1 $JUMP_HOST:~/ && ssh -A $JUMP_HOST -t scp $(basename $1) $2:~/ && ssh $JUMP_HOST -t rm $(basename $1)"
		scp $1 $JUMP_HOST:~/ && ssh -A $JUMP_HOST -t scp $(basename $1) $2:~/ && ssh $JUMP_HOST -t rm $(basename $1)
	else
		echo "scp $1 $2:~/ && ssh -A $2 -t scp $(basename $1) $3:~/ && ssh $2 -t rm $(basename $1)"
		scp $1 $2:~/ && ssh -A $2 -t scp $(basename $1) $3:~/ && ssh $2 -t rm $(basename $1)
	fi
}

tunnel () {
	# $1 = jump host
	# $2 = target host
	if [ ! -z $JUMP_HOST ]; then
		echo "ssh -A $JUMP_HOST -t ssh $1"
		ssh -A $JUMP_HOST -t ssh $1
	else
		echo "ssh -A $1 -t ssh $2"
		ssh -A $1 -t ssh $2
	fi
}
source /usr/bin/virtualenvwrapper.sh

export IDEA_JDK=/usr/java/jdk1.8.0_40/

#function delete-branch () {TO_DELETE=$(git rev-parse --abbrev-ref HEAD) && git checkout master && git pull && git branch -d $TO_DELETE && git push --no-verify origin :$TO_DELETE}

alias pp='python -mjson.tool'

function resetssh() {
	ssh $JUMP_HOST -t ssh-keygen -f "/home/uberj/.ssh/known_hosts" -R $1
}

function pprintxml() {
	echo $1 | python -c "import lxml.etree as etree;import sys;print(etree.tostring(etree.parse(sys.stdin.read().strip()), pretty_print=True))"
}

alias pprintjson='python -m json.tool' 
alias ascii='man ascii | grep -m 1 -A 63 --color=never Oct'

export NVM_DIR="/home/uberj/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval $(thefuck --alias)
export GOROOT=$HOME/bin/go1.6
export PATH=$GOROOT/bin:$PATH
source ~/.profile
alias killallzsh='pgrep zsh | xargs kill -9'

alias bumpopenvpn='sudo kill -1 $(pgrep openvpn)'
alias json2yaml='python -c "import sys;import json;import yaml; print(yaml.dump(yaml.load(json.dumps(json.loads(sys.stdin.read()))), default_flow_style=False))"'

#du -sk  ./* | sort -n | awk 'BEGIN{ pref[1]="K"; pref[2]="M"; pref[3]="G";} { total = total + $1; x = $1; y = 1; while( x > 1024 ) { x = (x + 1023)/1024; y++; } printf("%g%s\t%s\n",int(x*10)/10,pref[y],$2); } END { y = 1; while( total > 1024 ) { total = (total + 1023)/1024; y++; } printf("Total: %g%s\n",int(total*10)/10,pref[y]); }'

