#!/bin/bash -x
#
# Overwrite the gh-pages branch with our generated files.
#

# Stop on any errors.
set -e
# Read the name of your current branch to be able to return to it later.
current_branch=$(git rev-parse --abbrev-ref HEAD)
# Delete any existing gh-pages branch.
git branch | grep -q -Fw gh-pages && git branch -D gh-pages
# Create the gh-pages branch.
git checkout --orphan gh-pages
# Commit our file of interest.
git add --force public/mtcars.csv
git commit -m "ENH: Publish gh-pages"
# Push per https://stackoverflow.com/a/33178233
git push origin `git subtree split --prefix public gh-pages`:gh-pages --force
# Return to our working branch.
git checkout "$current_branch"
