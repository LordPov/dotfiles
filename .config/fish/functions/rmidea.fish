function rmidea -d "Clean out IntelliJ project files"
    find . | egrep '\.idea$|\.ipr$|\.iws$|\.iml$' | xargs rm -rf
end
