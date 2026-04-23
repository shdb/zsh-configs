#! /bin/zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# To customize prompt, run `p10k configure` or edit ~/.zsh.d/p10k.zsh.
[[ ! -f ~/.zsh.d/p10k.zsh ]] || source ~/.zsh.d/p10k.zsh
