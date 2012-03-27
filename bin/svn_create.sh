#!/bin/sh

test -n "$1" || exit 1
test -n "$2" && exit 1
svnadmin create /var/lib/svn/$1
chmod -R o-rwx,g+w /var/lib/svn/$1
