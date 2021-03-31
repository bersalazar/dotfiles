if test -f "$HOME/.zshrc-work"; then
  source "$HOME/.zshrc-work"
elif test -f "$HOME/.zshrc-personal"; then
  source "$HOME/.zshrc-personal"
else
  echo "ERROR: no .zshrc-[work|personal] file exists in $(echo ~)"
fi
