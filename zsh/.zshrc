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

# -- zsh
setopt NO_BEEP # disable error sounds from zsh
export ZSH="${HOME}/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7 # how often to zsh auto-update (in days)

ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true" # case-sensitive completion
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting
DISABLE_AUTO_TITLE="true"
HISTSIZE=1000000 # 1 million commands
SAVEHIST=1000000

if ! test -f "$HOME/.is_personal_computer"; then
  plugins=(git docker wd gradle gpg-agent asdf)
  export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"
  eval "$("${HOME}/.asdf/bin/asdf" exec direnv hook zsh)"
fi

# -- global settings (for personal or work)
xset r rate 200 50 # key repeat rate setting

for file in ~/.{aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done

# -- other sources
# -- must go before autocompleters
source $ZSH/oh-my-zsh.sh

# -- map caps lock to F9
xmodmap -e "keycode 66 = F9"

# -- autocompleters
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/home/bernardo/.asdf/shims/aws_completer' aws
eval "$(register-python-argcomplete pipx)"
source <(kubectl completion zsh)
source <(helm completion zsh)
source <(helmfile completion zsh)
# source <(minikube completion zsh)
source <(vcluster completion zsh)
source <(rclone completion zsh)
source <(pip completion --zsh)

# -- environment variables
export EDITOR='vim'
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:${MANPATH}"
export GPG_TTY=$(tty)
export PATH="${PATH}:${HOME}/.scripts:${HOME}/.local/bin:${HOME}/bin:${HOME}/go/bin"

# export TG_PROVIDER_CACHE=1
# export TG_PROVIDER_CACHE_DIR="$HOME/.cache/terragrunt-cache"

source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
