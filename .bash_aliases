
##############################################################
# BASH_ALIASES
##############################################################
#-------------------------------------------------------------
# The 'ls' family
#-------------------------------------------------------------
#alias ll="ls -l --group-directories-first"
alias ls='ls --color' # add colors for filetype recognition
alias la='ls -Al' # show hidden files
alias lx='ls -lXB' # sort by extension
alias lk='ls -lSr' # sort by size, biggest last
alias lc='ls -ltcr' # sort by and show change time, most recent last
alias lu='ls -ltur' # sort by and show access time, most recent last
alias lt='ls -ltr' # sort by date, most recent last
alias lm='ls -al |more' # pipe through 'more'
alias lr='ls -lR' # recursive ls
#alias tree='tree -Csu' # nice alternative to 'recursive ls'
alias manb='man -H'

# ------------------------------------------------------------
# Play nicely ...
# ------------------------------------------------------------
alias rm='rm -i'
alias rmdir='rmdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Colorize Maven Output
alias maven="command mvn"
function color_maven() {
    local BLUE="[0;34m"
    local RED="[0;31m"
    local LIGHT_RED="[1;31m"
    local LIGHT_GRAY="[0;37m"
    local LIGHT_GREEN="[1;32m"
    local LIGHT_BLUE="[1;34m"
    local LIGHT_CYAN="[1;36m"
    local YELLOW="[1;33m"
    local WHITE="[1;37m"
    local NO_COLOUR="[0m"
    maven "$@" | sed \
        -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${LIGHT_GREEN}Tests run: \1$NO_COLOUR, Failures: $RED\2$NO_COLOUR, Errors: $YELLOW\3$NO_COLOUR, Skipped: $LIGHT_BLUE\4$NO_COLOUR/g" \
        -e "s/\(\[\{0,1\}WARN\(ING\)\{0,1\}\]\{0,1\}.*\)/$YELLOW\1$NO_COLOUR/g" \
        -e "s/\(\[ERROR\].*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}FAILURE.*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}SUCCESS.*\)/$LIGHT_GREEN\1$NO_COLOUR/g" \
        -e "s/\(\[INFO\].*\)/$LIGHT_GRAY\1$NO_COLOUR/g"
    return $PIPESTATUS
}

alias mvn=color_maven
