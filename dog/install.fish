#!/usr/bin/env fish
if command -qs dog
	abbr -a dig 'dog A AAAA CNAME NS SOA TXT MX'
	abbr -a dogall 'dog A AAAA CNAME NS SOA TXT MX'
end