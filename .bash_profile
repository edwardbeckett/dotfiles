if [ -f ~/.bashrc ]; then
        . ~/.bashrc   # --> Read ~/.bashrc, if present.
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/d/Edward/.gvm/bin/gvm-init.sh" && -z $(which gvm-init.sh | grep '/gvm-init.sh') ]] && source "/d/Edward/.gvm/bin/gvm-init.sh"
