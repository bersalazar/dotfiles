#!/usr/bin/env bash

# -- powerlevel10k
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# -- linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# -- zsh
setopt NO_BEEP # disable error sounds from zsh
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7 # how often to zsh auto-update (in days)

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true" # case-sensitive completion
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting
DISABLE_AUTO_TITLE="true"
HISTSIZE=1000000 # 1 million commands
SAVEHIST=1000000

# -- source dotfiles
source "$HOME/.aliases"
source "$HOME/.functions"

# -- mise
eval "$(mise activate zsh)"

# -- PATH additions 
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
#export PATH="$HOME/.asdf/bin:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"

# -- other sources
# -- must go before autocompleters
source $ZSH/oh-my-zsh.sh
# -- autocompleters
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/home/bernardo/.local/share/mise/shims/aws_completer' aws

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(helmfile completion zsh)
source <(minikube completion zsh)
source <(vcluster completion zsh)

# -- custom settings
xset r rate 200 50 # key repeat rate setting

# -- environment variables
export EDITOR='vim'
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export TG_PROVIDER_CACHE=1
export TG_PROVIDER_CACHE_DIR="$HOME/.cache/terragrunt-cache"
export AWS_PAGER=""

#source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
