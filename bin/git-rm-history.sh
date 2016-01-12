#!/usr/bin/env bash

echo "starting the process of removing $1 from the history of this repo"

git filter-branch --force --index-filter "git rm --cached --ignore-unmatch $1" --prune-empty --tag-name-filter cat -- --all
