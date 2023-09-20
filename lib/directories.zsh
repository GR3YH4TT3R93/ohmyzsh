# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

# Smart directory listing aliases that fallback gracefully
# Uses logo-ls if available, then eza, then falls back to regular ls

if command -v logo-ls >/dev/null 2>&1; then
    alias lsa='logo-ls -AD'
    alias l='logo-ls -D'
    alias ll='logo-ls -lh'
    alias la='logo-ls -lAh'
elif command -v eza >/dev/null 2>&1; then
    alias lsa='eza -lah'
    alias l='eza -lah'
    alias ll='eza -lh'
    alias la='eza -lAh'
else
    alias lsa='ls -lah'
    alias l='ls -lah'
    alias ll='ls -lh'
    alias la='ls -lAh'
fi
