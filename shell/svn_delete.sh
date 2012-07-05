#!/bin/sh

test -n "$1" || exit 1
test -n "$2" && exit 1
TODAY=`date '+%F'`
test -d /home/trash/svn/$TODAY || mkdir /home/trash/svn/$TODAY
chmod 770 /home/trash/svn/$TODAY
test -d /home/trash/svn/$TODAY/$1 && rm -rf /home/trash/svn/$TODAY/$1
test -d /var/lib/svn/$1 && mv -f /var/lib/svn/$1 /home/trash/svn/$TODAY/
