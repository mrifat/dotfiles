# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ENV vars
. $HOME/dotfiles/bash_env

# Custom functions
. $HOME/dotfiles/custom_functions

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Render config
. $HOME/dotfiles/bash_render

# Alias definitions.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
. $HOME/dotfiles/bash_aliases

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Clear history ALLWAYS
cat /dev/null > ~/.bash_history && history -c && history -w

# Initialize rbenv
eval "$(rbenv init -)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
   --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
   --color info:108,prompt:109,spinner:108,pointer:168,marker:168'
