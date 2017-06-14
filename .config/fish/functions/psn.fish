function psn -d "Find process with given name"
    ps ax | grep -v "grep --colour $argv" | grep --colour $argv
end
