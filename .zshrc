export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"

plugins=(git)

source $ZSH/oh-my-zsh.sh


export PATH="$HOME/.config/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config/

alias zshconfig="cd ~/ && nvim ./.zshrc"
alias kittyconfig="cd ~/.config/kitty && nvim kitty.conf"
alias nvimconfig="cd ~/.config/nvim/ && nvim ."
alias tmuxconfig="cd ~/.config/tmux && nvim tmux.conf"
alias tmuxsource="tmux source ~/.config/tmux/tmux.conf"

export WORK_DIRS="$HOME/.config/ $HOME/git_lb/ $HOME/misc/"
alias gw='cd $(find -L $(echo $WORK_DIRS) -maxdepth 1 -type d | fzf)'

alias xcp="xclip -selection clipboard"
alias vim="nvim"


alias t="tmux-sessionizer" 
# alias tz="tmux new -s `find -L ~/fz/* -maxdepth 2 | fzf`"
alias clangdhelp="clang-format -style=llvm -dump-config > .clang-format"
alias gdb_print_argv1="p *(char**)($rsp + 16)"

tf() {
    tmux_sessions=$(tmux ls | sed 's/:.*//g')
    if [[ -z $TMUX ]]; then
        if tmux has-session -t="default" 2> /dev/null; then
            tmux attach -t="default"
        else
            tmux new -s default
        fi
    fi
}


serve(){{echo "HTTP/1.0 200 OK\r\nContent-Length:`wc -c <$1`\r\n\r\n`<$1`"}|nc -lvp 8080}

export WORK_ENV=no
