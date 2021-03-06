PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
export GOROOT="$HOME/.goroot"
export GOPATH="$HOME/.gopath"
PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export WASMTIME_HOME="$HOME/.wasmtime"
PATH="$WASMTIME_HOME/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
export INFOPATH
export DISPLAY
export CHKTEXRC="$HOME/dotfiles/chktexrc"
export EDITOR=vim
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --color='hl:9,hl+:9,spinner:16'"
export LESS=-RiWM
export LYNX_CFG="$HOME/dotfiles/lynx.cfg"
export MANPAGER="vim +MYMANPAGER -"
export MYPY_CACHE_DIR="$HOME/.cache/mypy"
export RLWRAP_HOME="$HOME/.config/rlwrap"
export RUST_BACKTRACE=1
export SCREENDIR="$HOME/.screen"
export SCREENRC="$HOME/dotfiles/.screenrc"
export VISUAL=vim
export XDG_CONFIG_HOME="$HOME/.config"

pc='_psjobs; history -a; history -c; history -r; __git_ps1 "'
pc=$pc'\[\e[0m\]\[\e]0;\u@\h '
[[ -n $MSYSTEM ]] && pc=$pc'$MSYSTEM '
pc=$pc'\w \d \A [\j] \a\]'
pc=$pc'\n$PSM\[\e[32m\]\u@\h '
[[ -n $MSYSTEM ]] && pc=$pc'\[\e[35m\]$MSYSTEM '
pc=$pc'\[\e[33m\]\w \[\e[38;5;93m\]$PSSHLVL \[\e[38;5;166m\]$PSJOBS\[\e[0m\]'
pc=$pc'" " \[\e[38;5;245m\]\t \${PIPESTATUS[@]}\[\e[0m\]\n\[\ek\e\\\\\]\\$ "'
export PROMPT_COMMAND=$pc
unset pc
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=2000
export HISTTIMEFORMAT="%c : "

export _uname=$(uname)
if [[ $_uname =~ NT-10.0 ]]; then
	export LANG=$(locale -uU)
	PATH="/c/ProgramData/chocolatey/bin:$PATH"
	PATH="/c/HashiCorp/Vagrant/bin:$PATH"
	PATH="/c/Users/$USER/.cargo/bin:$PATH"
	GOROOT=/c/Go
	GOPATH="/c/Users/$USER/go"
	PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
	export MSYS=winsymlinks:nativestrict
	DISPLAY=localhost:0
elif [[ $_uname == Darwin ]]; then
	# eval "$(docker-machine env default)"
	export _OLDPATH=$PATH
	PATH="/usr/local/opt/binutils/bin:$PATH"
	PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/ed/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/file-formula/bin:$PATH"
	PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/m4/bin:$PATH"
	PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
	PATH="/usr/local/opt/texinfo/bin:$PATH"
	MANPATH="/usr/local/opt/binutils/share/man:$MANPATH"
	MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/ed/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/file-formula/share/man:$MANPATH"
	MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/gnu-indent/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/m4/share/man:$MANPATH"
	MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"
	MANPATH="/usr/local/opt/texinfo/share/man:$MANPATH"
	INFOPATH="/usr/local/opt/binutils/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/coreutils/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/ed/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/findutils/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/gnu-indent/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/gnu-sed/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/gnu-tar/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/grep/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/m4/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/make/share/info:$INFOPATH"
	INFOPATH="/usr/local/opt/texinfo/share/info:$INFOPATH"
	export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
	export BASH_COMPLETION_DIR=/usr/local/share/bash-completion
elif [[ $(uname -r) =~ Microsoft ]]; then
	umask 022
	DISPLAY=localhost:0
fi

printf "\e]12;#00ffff\a"
printf "\e[2 q"

eval "$(dircolors ~/dotfiles/.dir_colors)"

[[ -r ~/.opam/opam-init/init.sh ]] && . ~/.opam/opam-init/init.sh
[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ -r ~/.localbash_profile.sh ]] && . ~/.localbash_profile.sh
true
