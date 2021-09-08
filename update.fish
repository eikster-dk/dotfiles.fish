#!/usr/bin/env fish
source ./functions.fish


for update in */update.fish
	$update
		and success $update
		or abort $update
end