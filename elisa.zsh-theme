# Elisa Oh-my-zsh! theme
# Designed by Patrick Lambein
# Inspired by Steve Losh's .zshrc
# (http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/)
# and by the Nethack Zsh Prompt
# (http://eseth.org/2009/nethack-term.html)
# 11 march 2013
#

# Load colors
autoload -U colors && colors
local reset white gray green red

reset="%{${reset_color}%}"
magenta="%{$fg[magenta]%}"
white="%{$fg[white]%}"
gray="%{$fg_bold[black]%}"
green="%{$fg_bold[green]%}"
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"

# Show directory type
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function setprompt() {
    local -a infoline llines rlines
    local i_width i_filler filler

    infoline+="╭─ "
    infoline+=(${white}'%n'${reset}) # Me
    if [[ -n $SSH_CLIENT ]]; then
        infoline+=( "${infoline[1]}@${yellow}%m${reset}" ) # Host if SSH'd
    fi
    infoline+=(" in ")
    if [[ -w $PWD ]]; then                      # Owned directory?
        infoline+=(${green})
    else
        infoline+=(${yellow})
    fi
    infoline+=("$(collapse_pwd)"" "${reset})    # Current directory

    # To understand this, a look into man zshexpn is helpful.
    i_width=${(S)infoline//\%\{*\%\}}
    # FIXME: this breaks on non-ASCII characters.
    i_width=${#${(%)i_width}}

    i_filler=$(($COLUMNS - $i_width + 5))

    filler="${gray}${(l:${i_filler}::─:)}${reset}"
    infoline[5]=( "${infoline[5]}${filler}" )

    llines+=( ${(j::)infoline} )
    llines+=( "╰─($(prompt_char)%(1j. %j.) %(!.#.$) ")
    rlines+=("$(git_prompt_info)")

    PROMPT=${(F)llines}
    RPROMPT=${(F)rlines}
}

# ZSH prompt display option
ZSH_THEME_GIT_PROMPT_PREFIX="["${magenta}
ZSH_THEME_GIT_PROMPT_SUFFIX=${reset}"]"
ZSH_THEME_GIT_PROMPT_DIRTY="${green}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${green}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function precmd {
    setprompt
}
