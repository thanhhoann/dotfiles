#!/usr/bin/env bash

main(){
	local sessions
	sessions=$(tmux ls | awk '{print $1}' FS=: | grep -o '[[:digit:]]\+' | sort -n)

	new=0
	for prev in $sessions
	do
		tmux rename -t "$prev" "$new"
		((new++))
	done
	return 0
}
main
