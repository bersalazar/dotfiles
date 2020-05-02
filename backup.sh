echo 'Backing up all dot files'

echo 'vimrc'
cp ~/.vimrc ./vim/vimrc

echo 'rectangle'
cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/

echo 'zshrc'
cp ~/.zshrc ./zsh/

echo 'iterm2'
cp ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm2/
