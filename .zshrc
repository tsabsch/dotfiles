# non oh-my-zsh stuff
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#zoxide
export ZOXIDE_CMD_OVERRIDE=cd
# zstyle :omz:plugins:ssh-agent agent-forwarding yes
zstyle :omz:plugins:ssh-agent quiet yes

# Path to your oh-my-zsh installation.
export ZSH="/Users/tsabsch/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="arrow"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
#
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  direnv
  docker
  fzf
  poetry
  zoxide
  # evalcache
  git
  gcloud
  #kubectl
  terraform
  history
  pyenv
  # tmux
)

# ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/tsabsch/.local/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"

export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

alias ls=lsd
alias v=nvim
alias lg=lazygit
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# TODO do I still need this?
export PATH="/usr/local/sbin:$PATH"

# where to store zcompdump files (completion helper)
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# reduce log level by direnv
export DIRENV_LOG_FORMAT=
# load direnv for tmux
# alias tmux='direnv exec / tmux'

# Created by `pipx` on 2024-04-04 08:58:47
export PATH="$PATH:/Users/tsabsch/.local/bin"
