# Created by newuser for 5.5.1

# Language
export LANG=en_US.UTF-8

# Prompt
#autoload -U promptinit && promptinit
#prompt suse

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# alias
alias ls='ls --color=auto'

# for fuckin %
sleep 1 && clear
