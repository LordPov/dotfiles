function grepc -d "Find string in C / C++ source files"
    grep -r --include '*.cpp' --include '*.c' --include '*.h' --include '*.hpp' $argv *
end
