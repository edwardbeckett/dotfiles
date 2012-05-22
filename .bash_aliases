##############################################################
# 			BASH_ALIASES
##############################################################
#-------------------------------------------------------------  
# The 'ls' family 
#-------------------------------------------------------------
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'
alias manb='man -H'

# ------------------------------------------------------------
# Play nicely ...
# ------------------------------------------------------------
alias rm='rm -i'
alias rmdir='rmdir -p'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
