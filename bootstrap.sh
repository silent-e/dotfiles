#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
#git pull origin master

function doIt() {
	rsync --exclude-from=bootstrap_rsync_excludes.txt -av --no-perms . ~
	source ~/.bash_profile
}

function previewIt() {
	rsync --exclude-from=bootstrap_rsync_excludes.txt --dry-run -av --no-perms . ~
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
