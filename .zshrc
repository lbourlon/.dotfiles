export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config/

ZSH_THEME="robbyrussell"
# ZSH_THEME="bureau"
# ZSH_THEME="avit"

ENABLE_CORRECTION="false"
plugins=(fzf timer)
TIMER_FORMAT='[took %d]'
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
alias xps="xclip -selection clipboard -o"

alias clangdhelp="clang-format -style=llvm -dump-config > .clang-format"
alias gdb_print_argv1="p *(char**)($rsp + 16)"

serve(){{echo "HTTP/1.0 200 OK\r\nContent-Length:`wc -c <$1`\r\n\r\n`<$1`"}|nc -lvp 8080}

alias v="nvim"

alias grb="git rebase"
alias grbi="git rebase -i HEAD~1"
alias grbc="rebase --continue"
alias grba="rebase --abort"
alias grbs="git rebase --skip"

alias gca="commit --amend"
alias gcf="commit --fixup HEAD"
alias gc="checkout"
alias gct="checkout --theirs"
alias gco="checkout --ours"
alias gu="reset --soft HEAD~"

alias gl="log --oneline"
alias glp="log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias glt="log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

# gd 	    git diff
# gdca 	git diff --cached
# gdcw 	git diff --cached --word-diff
# gds 	git diff --staged
# gdw 	git diff --word-diff
# gdv 	git diff -w "$@" | view -
# gdup 	git diff @{upstream}
# gignored 	git ls-files -v | grep "^[[:lower:]]"

export WORK_ENV=no
if [ -f ~/.extra_source.sh ]; then
    source ~/.extra_source.sh
fi
