function grepp -d "Find string in Maven pom.xml's"
    grep -r --include pom.xml $argv *
end
