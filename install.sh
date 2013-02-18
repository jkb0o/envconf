#! /bin/bash
CDIR=`pwd`
NAMES=(.vimrc .vim .screenrc .gitconfig)
git submodule init
git submodule update
for ((i=0;i<${#NAMES[@]};i++)); do
    NAME=${NAMES[${i}]}
    LOC=$HOME/$NAME
    ABS=$CDIR/$NAME
    if  [ -h "$LOC" ]
    then
        rm $LOC
    fi
    if [ -f "$LOC" ]
    then
        mv ${LOC} ${LOC}.old
    fi
    if [ -d "$LOC" ]
    then
        mv ${LOC} ${LOC}.old
    fi

    ln -s $ABS $LOC
done

