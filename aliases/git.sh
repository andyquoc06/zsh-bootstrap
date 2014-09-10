alias gbd="git branch -d $1"
alias gnb="git checkout -b $1"

alias gbase="git fetch origin && git rebase origin/develop"

# Git checkout
alias gc="git checkout $@"

# git commit
alias gi="git commit"

# git status
alias gs="git status"

# last tag
alias lasttag="git describe --abbrev=0 --tags"

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'

# git force stash pop
alias gpop="git stash show -p | git apply && git stash drop"
