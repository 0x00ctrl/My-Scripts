# wrapper script for preview searching files using fzf

# usage
# fvs nano    // (You can also use vim, and mousepad or any other text editor(just replace the name in the script)
# fvs with text editor option will open the view-search window but when you choose a file, it will be 
# automatically opened in the text editor

# fvs <dir u want to search>
# if path not specified, present working directory will be searched

# fzf program is a prerequisite for this
# sudo apt install fzf
# make sure to give executable permission to this script ->  chmod u+x fvs.sh
# and place this file inside any directory listed in your PATH environment variable to run it from your present working directory, no need to ./fvs.sh 

#!/usr/bin/env bash

if [ $# -eq 0 ]; then
        fzf --reverse --preview "cat {}"
        exit 1
elif [ $# -eq 1 ]; then
	prow=$1
	if [ "$prow" == "nano" ]; then
		nano "$(fzf --reverse --preview "cat {}")"
		exit 1
	elif [ "$prow" == "vim" ]; then
                vim "$(fzf --reverse --preview "cat {}")"
		exit 1
	elif [ "$prow" == "nvim" ]; then
                nvim "$(fzf --reverse --preview "cat {}")"
		exit 1	
	elif [ "$prow" == "mousepad" ]; then
                mousepad "$(fzf --reverse --preview "cat {}")"
		exit 1
	else
        	dir_path=$1
        	if [ -d "$dir_path" ]; then
                	fzf --reverse --walker-root=$dir_path --preview "cat {}"
                	exit 1
        	else
                	echo "Look at what u typed...."
                	exit 1
        	fi
	fi
fi
