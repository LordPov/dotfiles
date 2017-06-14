function psgrep -d "Find process with given name"
    ps axu | grep -v grep | grep "$argv" -i --color=auto
end
