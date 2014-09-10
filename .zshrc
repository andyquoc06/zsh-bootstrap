# Source file, if it exists
function try-source() {
  if [ -f $1 ]; then
    source $1;
  fi
}

source ~/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000

setopt appendhistory autocd beep extendedglob nomatch
bindkey -v
zstyle :compinstall filename '/Users/u779/.zshrc'
autoload -Uz compinit
compinit

# Detect OS
UNAME=`uname`
CURRENT_OS='Linux'
DISTRO=''

if [[ $UNAME == 'Darwin' ]]; then
    CURRENT_OS='OS X'
else
    # Must be Linux, determine distro
    # Work in progress, so far CentOS is the only Linux distro I have needed to
    # determine
    if [[ -f /etc/redhat-release ]]; then
        # CentOS or Redhat?
        if grep -q "CentOS" /etc/redhat-release; then
            DISTRO='CentOS'
        else
            DISTRO='RHEL'
        fi
    fi
fi

# antigen bundles (https://github.com/zsh-users/antigen)
antigen bundles <<EOBUNDLES
  fasd
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  jira
  jsontools
EOBUNDLES

try-source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search.git/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# activate theme
# antigen theme https://gist.github.com/sethmcl/daa7bfad597bb5f423d6 ice
antigen theme https://gist.github.com/sethmcl/5567c8519760c8e7b5d2 agnoster

# load environment
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# FasD
eval "$(fasd --init auto)"

# vim key bindings
bindkey -v

try-source ~/.nvm/nvm.sh

antigen apply
