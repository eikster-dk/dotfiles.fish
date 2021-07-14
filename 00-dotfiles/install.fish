#!/usr/bin/env fish

set -x OP_SESSION_my (op signin --raw)

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
