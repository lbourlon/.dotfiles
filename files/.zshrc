	# If you come from bash you might have to change your $PATH.
	# export PATH=$HOME/bin:/usr/local/bin:$PATH

	# Path to your oh-my-zsh installation.
	export ZSH="$HOME/.oh-my-zsh"

	# Set name of the theme to load --- if set to "random", it will
	# load a random theme each time oh-my-zsh is loaded, in which case,
	# to know which specific one was loaded, run: echo $RANDOM_THEME
	# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
	ZSH_THEME="robbyrussell"

	# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

	# Uncomment the following line to use hyphen-insensitive completion.
	# Case-sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

	# Uncomment the following line to change how often to auto-update (in days).
	# zstyle ':omz:update' frequency 13

	# Uncomment the following line if pasting URLs and other text is messed up.
	# DISABLE_MAGIC_FUNCTIONS="true"

	# Uncomment the following line to disable auto-setting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	ENABLE_CORRECTION="true"

	# Add wisely, as too many plugins slow down shell startup.
	plugins=(git zsh-autosuggestions)

	source $ZSH/oh-my-zsh.sh

	# User configuration

	# export MANPATH="/usr/local/man:$MANPATH"

	# You may need to manually set your language environment
	# export LANG=en_US.UTF-8

	# Preferred editor for local and remote sessions
	if [[ -n $SSH_CONNECTION ]]; then
	  export EDITOR='vim'
	else
	  export EDITOR='mvim'
	fi

	# Compilation flags
	# export ARCHFLAGS="-arch x86_64"

	alias zshconfig="nvim ~/.zshrc"
	alias alaconfig="nvim ~/.config/alacritty/alacritty.yml"
	alias vim="nvim"

	export EDITOR=/usr/bin/nvim
	export http_proxy=
	export https_proxy=
    	export XDG_CONFIG_HOME=$HOME/.config/
