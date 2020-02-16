HLORANGE=208
HLGREY=241
HLWHITE=255
HLPINK=207
HLGREEN=118
RED=196
BLACK=000
USERCOLOR=$RED

#Change color of username if user is not root
	if [ $UID -ne 0 ]; then
	USERCOLOR=$HLGREY
fi

# Fade in from left
FADEL="%{$FG[$HLGREY]%}|%{$BG[$HLGREY]%}%{$FG[$BLACK]%}▒%{$BG[$HLORANGE]%}%{$FG[$HLGREY]%}▓▒░҉𒀸"

# Half-life symbols
LAMDA="%{$FG[$HLWHITE]%}λ⃝."
LAMDA2="%{$FG[$HLORANGE]%}λ⃝."

# Fade out to right
FADER="%{$BG[$HLORANGE]%}%{$FG[$HLGREY]%}₈░҉▒▓%{$BG[$HLGREY]%}%{$FG[$BLACK]%}▒%{$BG[$BLACK]%}%{$FG[$HLGREY]%}|%{$reset_color%}"

# Working directory
DIRECTORY="%{$FG[$HLORANGE]%}%B%~/%b"

# Username
USER="%{$FG[$USERCOLOR]%}%B%n%b%{$reset_color%}"

# Prompt symbol
SYMBOL="%(!.#.%{$FG[$HLORANGE]%}%{$BG[$BLACK]%}%{$FG[$HLWHITE]%}$ )%{$reset_color%}"

# Prompt
PROMPT='%{$FG[$HLORANGE]%}╭─$FADEL$LAMDA$FADER$USER$DIRECTORY$(git_prompt_info)
%{$FG[$HLORANGE]%}╰─$SYMBOL'
RPROMPT="%t"

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[$HLPINK]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[$HLPINK]%})"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[$RED]%}+"

# LS colors, made with https://geoff.greer.fm/lscolors/
export LSCOLORS="Exfxcxdxbxegedabagacad"
export LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33"
