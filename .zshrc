export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config/

ZSH_THEME="avit"
TERM="xterm-256color" # stop issues with ssh

ENABLE_CORRECTION="false"
plugins=(fzf timer)
TIMER_FORMAT='[took %d]'
source $HOME/.oh-my-zsh/oh-my-zsh.sh

export WORK_DIRS="$HOME/.config/ $HOME/git_lb/ $HOME/misc/"
alias gw="cd \$(find -L \$(echo \$WORK_DIRS) -maxdepth 1 -type d | fzf)"

alias t="tmux-sessionizer" 
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    alias xc="wl-copy --trim-newline"
    alias xp="wl-paste --no-newline"
else
    alias xc="xclip -selection clipboard"
    alias xp="xclip -selection clipboard -o"
fi

alias clangdhelp="clang-format -style=llvm -dump-config > .clang-format"
alias gdb_print_argv1="p *(char**)($rsp + 16)"

serve(){{echo "HTTP/1.0 200 OK\r\nContent-Length:`wc -c <$1`\r\n\r\n`<$1`"}|nc -lvp 8080}

alias v="nvim"

# Better defaults if installed
if command -v ranger &> /dev/null; then alias r="ranger"; fi
if command -v nvim &> /dev/null; then
    export EDITOR=nvim
    alias vim="nvim";
else
    export EDITOR=vim
fi
if command -v exa &> /dev/null; then
    alias l="exa -la";
    alias ll="exa -lag";
    alias lt="exa -T";
else
    alias l="ls -hoa"
    alias ll="ls -lah"
fi

# COLOR
alias ip="ip --color=always"
alias ip="ip --color=auto"

# GIT
alias gs="git status"
alias gr="git rebase"
# alias gri="git rebase -i HEAD~"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"

# create fixup and auto rebase it:
alias gcfr="git commit --fixup HEAD && git rebase --autosquash HEAD~2"
# alias gcr='git reset --soft HEAD~1 && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'
# git commit --fixup=a0b1c2d3           # Perform the commit to fix broken a0b1c2d3
# git rebase -i --autosquash a0b1c2d3~1 # Now merge fixup commit into broken commit
#
## Rebase remote master onto current branch
# git pull --rebase origin master
#
# Push branch A onto branch B
# git push origin <branch_A>:<branch_B>

alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcf="git commit --fixup HEAD"

alias gp="git push"
alias gps="git push --set-upstream origin HEAD"
alias gx="git checkout"

alias gu="git reset --soft HEAD~" # unstage last commit
alias gur="git reset HEAD@{1}" # undo the unstaging (goes back one action on reflog)

alias gl='git log --pretty=format:"%C(yellow)%h  %Cblue[%cn] %Cred%d%Creset%n%B" --decorate -4'
alias gls2='git log --pretty=format:"%C(yellow)%h  %C(blue)[%<|(30,trunc)%cn]%C(reset)  %s%C(red)%d" --decorate -10'
alias gls='f() { git -c color.ui=always log --pretty=format:"%C(yellow)%h|%C(blue)[|%cn|]%C(reset)|%s%C(red)%d" --decorate -10 $* | column -t -s "|"; }; f'
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"


alias gd="git diff"
alias gdr='git diff origin/$(git rev-parse --abbrev-ref @) $(git rev-parse --abbrev-ref @)'
alias gdm='git diff master..HEAD'
alias gdp='git diff HEAD^..HEAD'

alias gdp='f() { if [ ! -z "$1" ]; then git show $1~..$1; else git diff @~..@; fi ; }; f'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

export WORK_ENV=no
if [ -f ~/.extra_source.sh ]; then
    source ~/.extra_source.sh
fi


alias le_flash='f() {sudo dd bs=4M if=$1 of=$2 oflag=sync status=progress}; f'

export PATH="/home/$USER/.config/bin/:$PATH"
