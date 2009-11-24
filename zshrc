#! /bin/zsh

autoload -U compinit zrecompile

zsh_cache=${HOME}/.zsh_cache
mkdir -p $zsh_cache

compinit -d $zsh_cache/zcomp-$HOST

for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
	zrecompile -p $f && rm -f $f.zwc.old
done

setopt extended_glob

for zshrc_snipplet in ~/.zsh.d/S[0-9][0-9]*[^~] ; do
        source $zshrc_snipplet
done
