export PS1="selia %1~ %# "

typeset -gU path PATH
path=(
  /opt/homebrew/bin(N-/)
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $HOME/.local/bin
  /usr/local/opt/openssl@3/bin(N-/)
  $path
)

export CLICOLOR=1

# WezTerm theme
if [[ "$TERM_PROGRAM" == "WezTerm" ]]; then
  export LSCOLORS="exfxcxdxbxegedabagacad"
fi


cde() {
  local last_cmd=$(fc -ln -1)
  local -a last_cmd_words=(${(z)last_cmd})
  local last_arg=${last_cmd_words[-1]}
  if [[ -d $last_arg ]]; then
    cd "$last_arg" || return
  else
    echo "cde: '$last_arg' is not a directory" >&2
  fi
}

# manpager config
export MANPAGER='nvim +Man!'


# Homebrew config
path+=(/opt/homebrew/sbin(N-/))
export LD_LIBRARY_PATH="/opt/homebrew/lib:$LD_LIBRARY_PATH"
export LDFLAGS="-L/opt/homebrew/lib"
export CFLAFGS="-I/opt/homebrew/include"

alias brew_dump-l='brew bundle dump --no-vscode -f'
alias brew_dump-g='brew bundle dump --global --no-vscode -f'
alias brew_bundle-l='brew bundle --file Brewfile'
alias brew_bundle-g='brew bundle --global'

# Go config
export GOPATH=$HOME/src/go
export KAGGLE_PROXY=$HOME/.kaggle/kaggle.json
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"

# c compiler config
export CC=/opt/homebrew/bin/gcc-15
export CXX=/opt/homebrew/bin/g++-15

# java config
path+=(/opt/homebrew/opt/openjdk@21/bin(N-/))
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

# qt@5 config
path+=(/opt/homebrew/opt/qt@5/bin(N-/))
export LDFLAGS="-L/opt/homebrew/opt/qt@5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/qt@5/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/qt@5/lib/pkgconfig"

# php@8.2 config
path+=(
  /opt/homebrew/opt/php@8.2/bin(N-/)
  /opt/homebrew/opt/php@8.2/sbin(N-/)
)
export LDFLAGS="-L/opt/homebrew/opt/php@8.2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/php@8.2/include"

# ruby(rbenv) config
if [[ -d ~/.rbenv  ]]; then
  path+=("${HOME}/.rbenv/bin(N-/)")
  eval "$(rbenv init -)"
fi

# perl(cpan) config
PERL_LOCAL_BASE="$HOME/.local/perl5"
path+=("$PERL_LOCAL_BASE/bin(N-/)")
export PERL5LIB="$PERL_LOCAL_BASE/lib/perl5"
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_BASE"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_BASE\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_BASE"

# lua5.1 config
path+=("/usr/local/lua-5.1/bin(N-/)")
export LUA_PATH="/usr/local/lua-5.1/?.lua;/usr/local/lua-5.1/?/init.lua;$LUA_PATH"
export LUA_CPATH="/usr/local/lua-5.1/lib/lua/5.1/?.so;/usr/local/lua-5.1/lib/lua/5.1/?/?.so;;$LUA_CPATH"

# lua5.4 config
# export LUA_CPATH="/opt/homebrew/lib/lua/5.4/?.so;"

# latexmk config
path+=("/usr/local/texlive/2026/bin/universal-darwin(N-/)")

autoload -Uz compinit && compinit

# zinit config
source "/opt/homebrew/opt/zinit/zinit.zsh"
autoload -Uz zinit
# zinit light olets/zsh-abbr
zinit ice lucid depth"1" blockf
export ZENO_HOME="$HOME/.config/zeno"
zinit light yuki-yano/zeno.zsh
export ZENO_GIT_CAT="bat --color=always"
export ZENO_GIT_TREE="eza --tree"
export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1
export ZENO_DISABLE_BUILTIN_COMPLETION=1

bindkey ' ' zeno-auto-snippet
bindkey '^m' zeno-auto-snippet-and-accept-line
bindkey '^i' zeno-completion
bindkey '^x ' zeno-insert-space
bindkey '^x^m' accept-line
bindkey '^x^z' zeno-toggle-auto-snippet
bindkey '^r' zeno-history-selection

zinit light zdharma-continuum/fast-syntax-highlighting
export FAST_SYNTAX_HIGHLIGHTING_THEME="$HOME/.config/zsh/fsh-themes/aardvark-blue.fast-theme"
