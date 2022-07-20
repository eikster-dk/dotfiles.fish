#!/usr/bin/env fish
if not test -d ~/.aws 
    mkdir ~/.aws
    touch ~/.aws/config
    touch ~/.aws/credentials
end 

ln -sf "$DOTFILES/aws/config.secret" "$HOME/.aws/config"
ln -sf "$DOTFILES/aws/credentials.secret" "$HOME/.aws/credentials"
