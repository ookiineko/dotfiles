#
# ==> hardcodes
#

[[ ! -f ~/.cust_hardcodes.d/shellrc ]] || source ~/.cust_hardcodes.d/shellrc

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
	[[ ! -f ~/.bin/exec/_ensure-ssh-agent ]] || source ~/.bin/exec/_ensure-ssh-agent
}

function watch_something() {
	watch -c -d -e -n 1 -t -x $*
}

#
# ==> proxies
#

export http_proxy=http://127.0.0.1:${__dotfiles_proxy_port}
export https_proxy=http://127.0.0.1:${__dotfiles_proxy_port}
export ftp_proxy=http://127.0.0.1:${__dotfiles_proxy_port}
export no_proxy='localhost,127.0.0.1'

#
# ==> mirrors
#

export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static

#
# ==> paths
#

[[ ! -d $HOME/.cargo/bin ]] || export PATH=$HOME/.cargo/bin:$PATH
[[ ! -d $HOME/bin ]] || export PATH=$HOME/bin:$PATH
[[ ! -d $HOME/.local/bin ]] || export PATH=$HOME/.local/bin:$PATH

if [ "$OSTYPE" = "msys" -o "$OSTYPE" = "cygwin" ]; then
	[[ ! -d $HOME/.bin/msys2_hack ]] | export PATH=$HOME/.bin/msys2_hack:$PATH

	# preset path var, so installation can work on the fly
	[[ -d $HOME/.cargo/bin ]] || export PATH=$HOME/.cargo/bin:$PATH

	export CARGO_HOME="$(cygpath -w ${HOME})\\.cargo"
	export RUSTUP_HOME="$(cygpath -w ${HOME})\\.rustup"
fi

#
# ==> locale
#

export LANG=C.UTF-8
export LC_CTYPE=C.UTF-8
