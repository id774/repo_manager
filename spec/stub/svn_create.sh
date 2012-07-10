#!/bin/sh

test -n "$1" || exit 1
test -n "$2" && exit 1
svnadmin create ./tmp/$1
chmod -R o-rwx,g+w ./tmp/$1
