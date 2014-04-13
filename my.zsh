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

current_path=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")
current_file=$current_path/$(basename -- "$0")


#[[ -z "$PS1" ]] && return

# Set options
setopt HIST_IGNORE_DUPS \
    NO_HIST_BEEP \
    PROMPT_SUBST \
    NO_BEEP \
    AUTO_CD \
    CORRECT \
    SHARE_HISTORY


# My.Zsh directory path
myzsh=${MYZSH:-$HOME}

fpath=($myzsh/lib/functions/{*.zsh,*.zwc}(N) $fpath)

# Autoload functions that have the executable bit on.

for lib ($myzsh/lib/*.zsh); do
    source $lib
done

# Load aliases
. $myzsh/aliases

# Load the theme and coloring
autoload -U colors && colors

theme=${THEME:-$myzsh/themes/lxsameer.zsh-theme}
. $theme



project_path=${PROJECTS:-~/src}

cdpath=($project_path $cdpath)


source $current_path/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh