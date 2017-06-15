function ls
    set ls_bin (command -s ls)
    switch (uname)
        case Darwin
            if test -e /usr/local/bin/gls
                set ls_bin /usr/local/bin/gls
            end
    end
    eval $ls_bin --color=auto $argv
end
