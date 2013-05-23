#!/bin/sh

test -n "$1" || exit 1
test -n "$2" || exit 1
test -n "$3" || exit 1
test -n "$4" && exit 1
TODAY=`date '+%F'`
test -d $2/svn/$TODAY || mkdir $2/svn/$TODAY
chmod 770 $2/svn/$TODAY
test -d $2/svn/$TODAY/$2 && rm -rf $2/svn/$TODAY/$2
test -d $1/$3 && mv -f $1/$3 $2/svn/$TODAY/
