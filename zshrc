# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --nocolor --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
   --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
   --color info:108,prompt:109,spinner:108,pointer:168,marker:168'
autoload -Uz compinit && compinit

#vim tags
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}
compctl -x 'C[-1,-t]' -K _get_tags -- vim

#end vim tags
# g as git grep
function g()
{
  if [ $# -ge 1 ]; then
    git grep $@
  else
    printf "No arguments supplied\nUse \`git grep --help\` for help\n"
  fi
}

alias db="pgcli -d db -h localhost -p port

. "$HOME/.asdf/asdf.sh"
