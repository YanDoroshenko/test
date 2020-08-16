#!/bin/bash
git pull &&
dbs=$(dirname $(grep -Rl $(ls *.gpkg | cut -d. -f1) $(find ~/.gramps/grampsdb -name name.txt))) &&
media=$(cat path) &&
for db in $dbs; do
    rm -r $db
done &&
rm -r $media &&
branch="$(date +%Y%m%d%H%M)-$(whoami)"
git checkout -b "$branch"
gramps *.gpkg &&
git add *.gpkg &&
git commit -m "Changes from $(whoami) on $(date)" &&
git push --set-upstream origin "$branch"
git checkout master
git branch -D "$branch"
