#!/usr/bin/env bash
dotfiles=$(realpath $(dirname ${BASH_SOURCE[0]}))
wget -qO $dotfiles/git-prompt.sh https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh
