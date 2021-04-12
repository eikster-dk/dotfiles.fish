function opcd -d "create document to 1password" 
    cat $argv[1] | op create document - --title "$argv[2]" --file-name "$argv[2]"
end