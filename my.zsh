# -----------------------------------------------------------------------------
#    My.Zsh - My personal zsh configuration
#    Copyright (C) 2013 Sameer Rahmani <lxsameer@gnu.org>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
# -----------------------------------------------------------------------------


#[[ -z "$PS1" ]] && return

# Set options
setopt HIST_IGNORE_DUPS \
    NO_HIST_BEEP \
    PROMPT_SUBST \
    NO_BEEP \
    AUTO_CD \
    CORRECT

# unset options
unsetopt SHARE_HISTORY


# My.Zsh directory path
myzsh=${MYZSH:-$HOME}

# Load aliases
. $myzsh/aliases

# Load the theme and coloring
autoload -U colors && colors

tput colors; print $terminfo[colors]; print $termcap[Co]

theme=${THEME:-$myzsh/themes/lxsameer.zsh-theme}
. $theme

fpath=($myzsh/lib/*.zsh(N) $fpath)

# Autoload functions that have the executable bit on.

for dirname in $fpath; do
    fns=( $dirname/*~*~(N.x:t) )
    (( ${#fns} )) && autoload $fns
done


project_path=${PROJECTS:-~/src}

cdpath=($project_path $cdpath)
