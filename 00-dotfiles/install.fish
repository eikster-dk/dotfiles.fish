#!/usr/bin/env fish

for f in $DOTFILES/*/conf.d/*.fish
	ln -sf $f ~/.config/fish/conf.d/(basename $f)
end

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
