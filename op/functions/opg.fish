function opg -d "get document from 1password" 
    op get document "$argv[1]" > $argv[2]
end