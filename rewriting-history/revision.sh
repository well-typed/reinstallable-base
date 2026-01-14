#!/bin/bash

set -e

# If you already have a copy of GHC, you can change this to point to it
GHC=https://gitlab.haskell.org/ghc/ghc.git
BASE=https://github.com/ghc/packages-base.git

# Get a fresh clone of GHC and call it base
git clone "$GHC" base --no-local
cd base
# Checkout the point where packages-base was merged into GHC
git checkout d8072fa08c9bbcc0de76a3710d6700f3e7dce2db
# Rewrite history to move all changes of libraries/base into root
# Note that git filter-repo changes hashes in commit messages
# So this step depends heavily on the git filter repo version
git filter-repo --force --subdirectory-filter libraries/base
# Get the current commit
commit=$(git log -1 --pretty=format:%H)
# Get the packages-base repo
git remote add packages-base "$BASE"
git fetch packages-base master --no-tags
# Replace the merge point with the one from packages-base
git replace $commit 52c0b09036c36f1ed928663abb2f295fd36a88bb
# Have git filter-repo clean it up
git filter-repo --force --proceed
# Switch back to master branch
git checkout master
