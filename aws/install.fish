#!/usr/bin/env fish
opg "dotfiles/aws/config" "./aws/config.secret"
opg "dotfiles/aws/credentials" "./aws/credentials.secret"

ln -sf "$DOTFILES/aws/config.secret" "$HOME/.aws/config"
ln -sf "$DOTFILES/aws/credentials.secret" "$HOME/.aws/credentials"