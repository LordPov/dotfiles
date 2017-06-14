function grepj -d "Find string in Java source files"
    grep -r --include '*.java' $argv *
end
