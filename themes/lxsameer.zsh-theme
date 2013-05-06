# lxsameer.zsh-theme
#
# Author: @lxsameer <lxsameer@gnu.org>
# Repo: https://github.com/lxsameer/oh-my-zsh
#
# Created on:		Apr 10, 2012

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
   echo "${PWD/$HOME/~}"
}
function spaces() {
    local git=$(my_git_prompt_info)

    if [ ${#git} != 0 ]; then
	local clean=$(parse_git_dirty)
	if [ ${#clean} != 0 ]; then
	    (( git = ${#git} - 30 - ${#clean} + 1 ))
	else
	    (( git = ${#git} - 30 ))
	fi
    else
	git=0
    fi

    local termwidth
    (( termwidth = ${COLUMNS} - 3 - ${#$(get_pwd)} - ${git} ))

    local spacing=" "
    for i in {1..$termwidth}; do
	spacing="${spacing}-"
    done
    echo $spacing
}
function user_sign () {
    if [ $UID != 0 ]; then
	echo "%F{027}»"
    else
	echo "%F{009}#"
    fi
}

PROMPT='
%F{003}%~%F{008}$(spaces) $(my_git_prompt_info)
$(user_sign) %f'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%F{002}["
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{003}*"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{002}]"
