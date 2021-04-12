#!/usr/bin/env fish

op get document "dotfiles/nuuday/install.secret.fish"  > ./nuuday/install.secret.fish

chmod +x ./install.secret.fish

./install.secret.fish