#
# ==> generic profiles
#

[[ ! -f ~/.cust_shellrc.sh ]] || source ~/.cust_shellrc.sh

[[ ! -f ~/.cust_hardcodes.d/zshrc ]] || . ~/.cust_hardcodes.d/zshrc

#
# ==> history
#

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000

# preference, borrowed from oh-my-zsh
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE

#
# ==> behaviors
#

setopt auto_cd
setopt auto_pushd

#
# ==> completion
#
autoload -Uz compinit
compinit

# interactive completion
zstyle ':completion:*' menu select
zmodload zsh/complist

# caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${HOME}/.cache/zsh/compcache"

# https://unix.stackexchange.com/questions/308315/how-can-i-configure-zsh-completion-to-show-hidden-files-and-folders
setopt globdots

# colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# desc
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' group-name ''

# case, hyphen insensitive, borrowed from oh-my-zsh
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'

#
# ==> key-bindings, borrowed from oh-my-zsh
#

bindkey -e

# https://stackoverflow.com/questions/444951/zsh-stop-backward-kill-word-on-directory-delimiter
autoload -U select-word-style
select-word-style bash

# history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# [Ctrl-Delete]
bindkey '^[[3;5~' kill-word

# [Ctrl+LeftArrow]
bindkey '^[[1;5D' backward-word

# [Ctrl+RigthArrow]
bindkey '^[[1;5C' forward-word

# [Delete]
bindkey '^[[3~' delete-char

# [Home]
bindkey '^[[H' beginning-of-line

# [End]
bindkey '^[[F' end-of-line

# [PageUp]
bindkey '^[[5~' up-line-or-history

# [PageDown]
bindkey '^[[6~' down-line-or-history

# https://superuser.com/questions/799574/do-not-expand-wildcard-on-tab-completion
bindkey "^I" complete-word

#
# ==> misc
#

setopt interactivecomments

#
# ==> instant shell
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# ==> plugins
#

__zshrc_ppfx="${__zshrc_plugin_prefix}"

for __zshrc_pn in "$__zshrc_plugins[@]"; do
	__zshrc_pd="${__zshrc_ppfx}/${__zshrc_pn}"
	__zshrc_pp="${__zshrc_pd}/${__zshrc_pn}.zsh"

	[[ ! -f "${__zshrc_pp}" ]] || source "${__zshrc_pp}"
done

for __cust_zshpn in "${__cust_zsh_plugins[@]}"; do
	__cust_zshpp="$HOME/.cust_zsh_plugins.d/${__cust_zshpn}.plugin.zsh"

	[[ ! -f "${__cust_zshpp}" ]] || source "${__cust_zshpp}"
done

#
# ==> themes
#

[[ ! -f "${__zshrc_theme}" ]] || source "${__zshrc_theme}"

#
# ==> addons
#

[[ ! -f ~/.cust_hardcodes.d/post_zshrc ]] || . ~/.cust_hardcodes.d/post_zshrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
