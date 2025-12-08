export PS1="selia %1~ %# "
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin:/usr/local/opt/openssl@3/bin


# iTerm2 theme
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  export CLICOLOR=1
  export TERM=xterm-256color
fi

# WezTerm theme
if [[ "$TERM_PROGRAM" == "WezTerm" ]]; then
  export CLICOLOR=1
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

# Homebrew config
export PATH="/opt/homebrew/sbin:$PATH"
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
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@21/include"

# qt@5 config
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/qt@5/lib"
export CPPFLAGS="-I/opt/homebrew/opt/qt@5/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/qt@5/lib/pkgconfig"

# php@8.2 config
export PATH="/opt/homebrew/opt/php@8.2/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.2/sbin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/php@8.2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/php@8.2/include"



# ruby(rbenv) config
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"


# perl(cpan) config
PERL_LOCAL_BASE="$HOME/.local/perl5"
export PATH="$PERL_LOCAL_BASE/bin:$PATH"
export PERL5LIB="$PERL_LOCAL_BASE/lib/perl5"
export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_BASE"
export PERL_MB_OPT="--install_base \"$PERL_LOCAL_BASE\""
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_BASE"


# lua5.1 config
export PATH="/usr/local/lua-5.1/bin:$PATH"
export LUA_PATH="/usr/local/lua-5.1/?.lua;/usr/local/lua-5.1/?/init.lua;$LUA_PATH"
export LUA_CPATH="/usr/local/lua-5.1/lib/lua/5.1/?.so;/usr/local/lua-5.1/lib/lua/5.1/?/?.so;;$LUA_CPATH"

# lua5.4 config
# export LUA_CPATH="/opt/homebrew/lib/lua/5.4/?.so;"


# mysql config
export PATH="/usr/local/mysql-8.4.7-macos15-arm64/bin:$PATH"

# latexmk config
export PATH="/usr/local/texlive/2025/bin/universal-darwin:$PATH"

autoload -Uz compinit && compinit

# zinit config
source "/opt/homebrew/opt/zinit/zinit.zsh"
autoload -Uz zinit
# zinit light olets/zsh-abbr
zinit light zdharma-continuum/fast-syntax-highlighting
export FAST_SYNTAX_HIGHLIGHTING_THEME="$HOME/.config/zsh/fsh-themes/aardvark-blue.fast-theme"
zinit ice lucid depth"1" blockf
export ZENO_HOME="$HOME/.config/zeno"
zinit light yuki-yano/zeno.zsh
export ZENO_GIT_CAT="bat --color=always"
export ZENO_GIT_TREE="eza --tree"
export ZENO_DISABLE_EXECUTE_CACHE_COMMAND=1
export ZENO_DISABLE_BUILTIN_COMPLETION=1

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^x ' zeno-insert-space
  bindkey '^x^m' accept-line
  bindkey '^x^z' zeno-toggle-auto-snippet
  bindkey '^r' zeno-history-selection
fi
