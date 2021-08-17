#!/bin/zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH
ln -sfn ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

source ~/.zshrc

# Ensure that worker logs will scroll and you can use binding.pry for Shopify
serverScriptPath=/src/github.com/shopify/shopify/.spin/bin/server
if [[ -f ${serverScriptPath} ]]; then
  sed --in-place=.backup -e 's/ >log\/worker.log \&//' ${serverScriptPath}
fi
