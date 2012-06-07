#!/bin/sh
#Luis-Cruz 2013 || ljc2491@gmail.com

# variable $1 is designated name of new branch
# variable $2 is designated name of branch/revision
# note to self

dest=${1}
drev=${2}

if [ -z "$dest" ]; then
    echo "! No destination branch defined !"
    read dest
fi

echo "NOTE: Make SURE your current branch is up to date!!"
echo ""
echo "You are updating your current branch to $dest using changes from ${2}"
echo ""
echo "Starting..."

# checkout to new branch
git checkout -b $dest

# add in aosp remote using remote commands
aospremote

# checkout to updated revision
git checkout android-4.2.2_r1

# make temp branch
git checkout -b temp

# checkout back to our branch
git checkout $dest 

# rebase aokp changes over temp branch 
git rebase temp
