PROMPT="%{$fg[white]%}[%{$reset_color%}"

PROMPT+="%{$fg_bold[cyan]%}%~%{$reset_color%}"         # pwd
PROMPT+='%(?.., %{$fg[red]%}%?%{$reset_color%})'       # $?

# Git
if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
    PROMPT+=', '
    PROMPT+="%{$fg[blue]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
    if [[ $(git status --short | wc -l) -gt 0 ]]; then # files changed
        PROMPT+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
    fi
fi

# PID ($!)
if [[ $! -ne 0 ]]; then
    PROMPT+=', '
    PROMPT+="%{$fg[yellow]%}PID:$!%{$reset_color%}"
fi

PROMPT+="%{$fg[white]%}]: %# %{$reset_color%}% "

