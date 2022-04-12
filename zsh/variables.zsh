# Global variables
# --------------------------------------

# Oh My ZSH
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="agnoster"

# Path
export PATH="$HOME/.zsh/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Editor
export VISUAL=vim
export EDITOR="$VISUAL"

alias grsm='git reset --soft $(git_main_branch)'

function debug() {
  local method="$1"

  if [ "$method" != "server" ] && [ "$method" != "worker" ]; then
    echo "Must specify either server or worker for debug"
    return 1
  fi

  cmd=""
  cat .spin/Procfile | while read line
  do
    if [[ "$line" =~ $method:* ]]; then
      cmd="${line:8}"
    fi
  done

  systemctl stop "proc-shopify--shopify@${method}.service"
  eval $cmd
}
