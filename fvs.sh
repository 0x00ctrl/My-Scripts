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

#!/bin/bash
# wrapper script for preview searching files using fzf

if [[ "$1" == "nano" || "$1" == "micro" || "$1" == "vim" || "$1" == "mousepad" ]]; then
 	$1 $(fzf --reverse --preview "cat {}")
    exit 1
fi

if [ $# -eq 0 ]; then
        fzf --reverse --preview "cat {}"
        exit 1
elif [ $# -eq 1 ]; then
        dir_path=$1
        if [ -d "$dir_path" ]; then
                fzf --reverse --walker-root=$dir_path --preview "cat {}"
                exit 1
        else
                echo "Invalid Directory!!"
                exit 1
        fi
fi
