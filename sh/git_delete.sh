#!/bin/sh

test -n "$1" || exit 1
test -n "$2" || exit 1
test -n "$3" || exit 1
test -n "$4" && exit 1
TODAY=`date '+%F'`
test -d $2/git/$TODAY || mkdir $2/git/$TODAY
chmod 770 $2/git/$TODAY
test -d $2/git/$TODAY/$3.git && rm -rf $2/git/$TODAY/$3.git
test -d $1/$3.git && mv -f $1/$3.git $2/git/$TODAY/
