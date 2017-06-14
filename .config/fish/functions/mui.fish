function mui -d "Maven install with update, skip tests"
    mvn -U install -DskipTests $argv
end
