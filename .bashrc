# its almost the default /etc/bash.bashrc 
# may require some additionnal git installation / sources git-prompt package 
# /etc/bash_completion.d/git-prompt
if [ -r /etc/bash_completion.d/git-prompt ]; then
	. /etc/bash_completion.d/git-prompt
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# strongly inspired by http://feedreader.com/feed/Kevin_Decherf_s_blog/25920209
# GIT PS1
# COLORS
LIGHT_GRAY="\[\033[0;37m\]"; BLUE="\[\033[0;34m\]"; RED="\[\033[0;31m\]"; LIGHT_RED="\[\033[1;31m\]";
GREEN="\[\033[0;32m\]"; WHITE="\[\033[1;37m\]"; LIGHT_GRAY="\[\033[0;37m\]"; YELLOW="\[\033[1;33m\]";
BROWN="\[\033[0;33m\]"; BLACK="\[\033[0;30m\]";PURPLE="\[\033[0;35m\]";CYAN="\[\033[0;36m\]";
# GIT PROMPT (http://gist.github.com/120804)
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/';
}
function parse_git_status {
  git status 2> /dev/null | sed -e '/(working directory clean)$/!d' | wc -l;
}
function check_git_changes {
  # tput setaf 1 = RED, tput setaf 2 = GREEN
	  [ `parse_git_status` -ne 1 ] && tput setaf 1 || tput setaf 2
	}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# can be verbose, legacy, git, auto, svn
GIT_PS1_SHOWUPSTREAM="auto"

PS1="$CYAN\$(date +%H:%M) $txtblu\w$txtrst\[\$(check_git_changes)\] \$(__git_ps1 '(%s)')$txtrst\$ "


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
	
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
