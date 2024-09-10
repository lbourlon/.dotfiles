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
# if command -v bat &> /dev/null; then alias cat="bat"; fi
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

# GIT
alias gs="git status"
alias gr="git rebase"
alias gri="git rebase -i HEAD~"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcf="git commit --fixup HEAD"

# alias gcr='git reset --soft HEAD~1 && git commit --edit -m"$(git log --format=%B --reverse HEAD..HEAD@{1})"'
alias gcfr="git commit --fixup HEAD && git rebase --autosquash HEAD~2"

# git commit --fixup=a0b1c2d3           # Perform the commit to fix broken a0b1c2d3
# git rebase -i --autosquash a0b1c2d3~1 # Now merge fixup commit into broken commit


alias gx="git checkout"
alias gu="git reset --soft HEAD~" # unstage last commit
alias gur="git reset 'HEAD@{1}" # undo the unstaging (goes back one action on reflog)

alias gl="git log --oneline"
alias gls="git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate"
alias glt="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

alias gd="git diff"
alias gdr='git diff origin/$(git rev-parse --abbrev-ref @) $(git rev-parse --abbrev-ref @)'
alias gdm='echo TODO'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

export WORK_ENV=no
if [ -f ~/.extra_source.sh ]; then
    source ~/.extra_source.sh
fi
