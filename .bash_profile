# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# add completion to git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

eval "$(rbenv init -)"
