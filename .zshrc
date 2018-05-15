# Created by newuser for 5.5.1

# Language
export LANG=en_US.UTF-8

# Powerline 
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

# tmux
[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

# alias
alias ls='ls --color=auto'


# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

# Compinit
autoload -Uz compinit && compinit

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug hilghting
zplug "zsh-users/zsh-syntax-highlighting"
# history 
zplug "zsh-users/zsh-history-substring-search"
# completion
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

zplug load

# for fuckin %
sleep 1 && clear

