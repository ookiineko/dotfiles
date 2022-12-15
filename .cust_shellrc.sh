function @ensure_ssh_agent@() {
       	source ~/.bin/ensure-ssh-agent
}

export GPG_TTY=$(tty)
export PATH=$HOME/.bin:$PATH
export LC_ALL=C
export http_proxy='http://127.0.0.1:56252'
export https_proxy='http://127.0.0.1:56252'
export ftp_proxy='http://127.0.0.1:56252'
export no_proxy='localhost'
export GOPROXY='https://goproxy.cn,direct'
export RUSTUP_DIST_SERVER='https://cmcc.mirrors.ustc.edu.cn/rust-static'
export RUSTUP_UPDATE_ROOT='https://cmcc.mirrors.ustc.edu.cn/rust-static/rustup'
export REPO_URL='https://mirrors.tsinghua.tuna.edu.cn/git/git-repo'

export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

alias ls='ls --color'
alias grep='grep --color'
alias diff='diff --color=auto'

[[ ! -z "$(command -v ip)" ]] && alias ip='ip -color=auto'
[[ ! -z "$(command -v dmesg)" ]] && alias dmesg='dmesg --color=auto'

alias pacman='pacman --color=auto'

# uncomment for a login msg
# echo -e 'Welcome come back! You may need to:\n@ensure_ssh_agent@'

