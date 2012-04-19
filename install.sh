#!/bin/bash

cp git-backup "$HOME/bin"
cat aliases.bash >> "$HOME/.bashrc"
. "$HOME/.bashrc"
