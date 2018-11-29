#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
#git pull origin master

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "laptop" --exclude "LICENSE-MIT.txt" \
    --exclude ".vim/plugged" \
    -av --no-perms . ~
	source ~/.bash_profile
}

function previewIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "laptop" --exclude "LICENSE-MIT.txt" \
    --exclude ".vim/plugged" \
    --dry-run \
    -av --no-perms . ~
	source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n/[p]review) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
  elif [[ $REPLY =~ ^[Pp]$ ]]; then
    echo "Here's a preview..."
    previewIt
	fi
fi

unset doIt
unset previewIt
