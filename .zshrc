# Created by newuser for 5.5.1

# Language
export LANG=en_US.UTF-8

# Prompt
autoload -U promptinit && promptinit
prompt suse

# Powerline 
#powerline-daemon -q
#. ~/.local/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

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

#function _window_title_cmd () {
#  local pwd="${PWD/~HOME/~}"
#  print -n "\e]0;"
#  print -n "${pwd##*/} (${HOST%%.*})"
#  print -n "\a"
#}
#
#function _window_title_exec () {
#  local pwd="${PWD/~HOME/~}"
#  print -n "\e]0;"
#  print -n "${1%% *}:${pwd##*/} (${HOST%%.*})"
#  print -n "\a"
#}
#
#[[ "$TERM" =~ "^termite" ]] && {
#  add-zsh-hook precmd _window_title_cmd
#  add-zsh-hook preexec _window_title_exec
#}

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac
