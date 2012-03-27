#!/bin/sh

test -n "$1" || exit 1
test -n "$2" && exit 1
TODAY=`date '+%F'`
test -d /home/trash/git/$TODAY || mkdir /home/trash/git/$TODAY
chmod 770 /home/trash/git/$TODAY
test -d /home/trash/git/$TODAY/$1.git && rm -rf /home/trash/git/$TODAY/$1.git
test -d /var/lib/git/$1.git && mv -f /var/lib/git/$1.git /home/trash/git/$TODAY/
