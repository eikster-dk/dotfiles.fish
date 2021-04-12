function oped -d "edit document to 1password" 
    cat $argv[1] | op edit document $argv[2] -
end