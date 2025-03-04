#!/bin/sh

die() {
	echo "$@" >&2
	exit 1
}

command -v rcup || die "Install rcm"

env \
	RCRC="$HOME/.dotfiles/rcrc" \
	PATH="$HOME/.local/bin:$PATH" \
	rcup -f

exec bash
