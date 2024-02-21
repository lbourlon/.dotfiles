export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config/

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
plugins=(fzf git)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias kittyconfig="nvim ~/.config/kitty/kitty.conf"
alias nvimconfig="nvim ~/.config/nvim/"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias tmuxsource="tmux source ~/.config/tmux/tmux.conf"

export WORK_DIRS="$HOME/.config/ $HOME/git_lb/ $HOME/misc/"
alias gw="cd \$(find -L \$(echo \$WORK_DIRS) -maxdepth 1 -type d | fzf)"

alias t="tmux-sessionizer" 
alias xcp="xclip -selection clipboard"
xcp_sh(){xclip -selection clipboard}

alias clangdhelp="clang-format -style=llvm -dump-config > .clang-format"
alias gdb_print_argv1="p *(char**)($rsp + 16)"

serve(){{echo "HTTP/1.0 200 OK\r\nContent-Length:`wc -c <$1`\r\n\r\n`<$1`"}|nc -lvp 8080}

export WORK_ENV=no
if [ -f ~/.extra_source.sh ]; then
    source ~/.extra_source.sh
fi
