#
# ==> colored output
#

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

alias ls='ls --color'

alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias grep='grep --color'
alias diff='diff --color=auto'
alias pacman='pacman --color=auto'

[[ ! -z "$(command -v ip)" ]] && alias ip='ip -color=auto'
[[ ! -z "$(command -v dmesg)" ]] && alias dmesg='dmesg --color=auto'

export TERM=xterm-256color

# standard environment var
eval `dircolors`

#
# ==> git plugin, borrowed from oh-my-zsh
#

alias gst='git status'
alias glo='git log --oneline --decorate'

#
# ==> quick cd, borrowed from oh-my-zsh
#

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias ......='cd ......'
alias .......='cd .......'
alias ........='cd ........'
alias .........='cd .........'
alias ..........='cd ..........'

#
# ==> misc
#

# interactive
export EDITOR=nano

# gpg - prefer terminal auth
export GPG_TTY=$(tty)

# Msys2/Cygwin - symlink
if [ "$OSTYPE" = "msys" ]; then
	export MSYS=winsymlinks:native
elif [ "$OSTYPE" = "cygwin" ]; then
	export CYGWIN=winsymlinks:sys
fi

function ensure_ssh_agent() {
       	source ~/.bin/exec/_ensure-ssh-agent
}

function watch_something() {
	watch -c -d -e -n 1 -t -x $*
}

#
# ==> proxies
#

export http_proxy=http://127.0.0.1:56252
export https_proxy=http://127.0.0.1:56252
export ftp_proxy=http://127.0.0.1:56252
export no_proxy='localhost,127.0.0.1'

#
# ==> paths
#

export PATH=$HOME/.bin:$HOME/.local/bin:$PATH

if [ "$OSTYPE" = "msys" -o "$OSTYPE" = "cygwin" ]; then
	export PATH=$HOME/.bin/msys2_hack:$PATH

	export CARGO_HOME="$(cygpath -m ${HOME})"
	export RUSTUP_HOME="$(cygpath -m ${HOME})"
fi

#
# ==> locale
#

export LANG=C.UTF-8
export LC_CTYPE=C.UTF-8
