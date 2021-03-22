#!/usr/bin/env fish

### general configuration
set -Ux DOTFILES (PWD)
set -Ux PROJECTS ~/code

set -Ux EDITOR vim
set -Ux VISUAL $EDITOR
set -Ux WEDITOR code

set -Ua fish_user_paths $DOTFILES/bin $HOME/.bin


### setup functions
for f in $DOTFILES/*/functions
	set skip false
    for val in $fish_function_path
        if [ "$val" = "$f" ]
            set skip true
        end
    end

    if not $skip
        echo "setting up function path"
        set -Up fish_function_path $f
    else 
        echo "skipping $f"
    end
end
