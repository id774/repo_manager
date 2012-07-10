#!/bin/sh

test -n "$1" || exit 1
test -n "$2" && exit 1
mkdir -p ./tmp/$1.git
cd ./tmp/$1.git
git init --bare --shared
cd ../..
chmod -R o-rwx,g+ws ./tmp/$1.git

exit 0
