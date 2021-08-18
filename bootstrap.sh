#!/bin/zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
sh -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~"
sh -c " git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"

# ZSH
ln -sfn ~/dotfiles/zsh ~/.zsh
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zshrc

# Ensure that worker logs will scroll and you can use binding.pry for Shopify
serverScriptPath=/src/github.com/shopify/shopify/.spin/bin/server
if [[ -f ${serverScriptPath} ]]; then
  sed --in-place=.backup -e 's/ >log\/worker.log \&//' ${serverScriptPath}
fi
