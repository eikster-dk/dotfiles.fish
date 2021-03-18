function aws-sso -d "Login with aws sso" 
    aws --profile $argv[1] sso login
end