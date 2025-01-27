export PS1="selia %1~ %# "
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/dotnet:$HOME/.local/bin:/usr/local/opt/openssl@3/bin


# iTerm2 theme
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
  export CLICOLOR=1
  export termguicolors
  export TERM=xterm-256color
fi

# alias config
alias vi='/opt/homebrew/bin/nvim'
alias vz='nvim ~/.zshrc'
alias sz='source ~/.zshrc'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'


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
export DOTNET_ROOT=$HOME/dotnet
export KAGGLE_PROXY=$HOME/.kaggle/kaggle.json
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"


# Python config
alias python='python3'

# c compiler config
alias gcc='gcc-14'
alias g++='g++-14'
export CC=/opt/homebrew/bin/gcc-14
export CXX=/opt/homebrew/bin/g++-14

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


# deno(dvm) config
export DVM_DIR="$HOME/.dvm"
export PATH="$DVM_DIR/bin:$PATH"

# latexmk config
export PATH="/usr/local/texlive/2024/bin/universal-darwin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/gorilla-cli/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/gorilla-cli/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/gorilla-cli/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/gorilla-cli/google-cloud-sdk/completion.zsh.inc'; fi


autoload -Uz compinit && compinit
