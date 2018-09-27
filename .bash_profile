#! /bin/sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
export PS1="[\w]: "
export GODOT_HOME="$HOME/proj/godot"
export GODOT="$GODOT_HOME/bin/godot.osx.tools.64"


