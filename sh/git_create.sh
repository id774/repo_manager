#!/bin/sh

test -n "$1" || exit 1
test -n "$2" || exit 1
test -n "$3" && exit 1
mkdir -p $1/$2.git
cd $1/$2.git
git init --bare --shared
chmod -R o-rwx,g+ws $1/$2.git
