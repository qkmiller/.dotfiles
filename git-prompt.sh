  PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	PS1="$PS1"'\[\033[32m\]'       # change to green
	PS1="$PS1"'\u@\h '             # user@host<space>
	PS1="$PS1"'\[\033[95m\]'       # change to cyan
	PS1="$PS1"'\w'                 # current working directory
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[39m\]'       # change to cyan
	PS1="$PS1"'$ '                 # prompt

