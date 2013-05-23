#!/bin/sh

test -n "$1" || exit 1
test -n "$2" || exit 1
test -n "$3" && exit 1
svnadmin create $1/$2
chmod -R o-rwx,g+w $1/$2
