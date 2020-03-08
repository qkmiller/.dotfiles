ORANGE=%{$FG[214]%}
GREY=%{$FG[008]%}
WHITE=%{$FG[255]%}
PINK=207
PURP=%{$FG[012]%}
GREEN=%{$FG[002]%}
RED=196
BLACK=000

# Working directory
DIRECTORY="$PURP%1~/"

# Username
USER="$GREEN%B%n@%M$WHITE:%B%{$reset_color%}"

# Prompt symbol
SYMBOL="%(!.#.$)"

# Prompt
PROMPT='$GREEN$USER$DIRECTORY$(git_prompt_info)%{$reset_color%}$SYMBOL '
RPROMPT="%t"

# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="$GREY("
ZSH_THEME_GIT_PROMPT_SUFFIX="$GREY)"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$ORANGE*"
