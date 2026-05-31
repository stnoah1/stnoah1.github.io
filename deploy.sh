#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"


# update CV
printf "\033[0;32mUpdate CV.pdf...\033[0m\n"
wget https://github.com/stnoah1/CV/raw/master/CV.pdf -O assets/files/curriculum_vitae.pdf

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
# Add changes to git.
#git pull
git add .

git commit -m "$msg"

# Push source and build repos.
git push -u origin main
