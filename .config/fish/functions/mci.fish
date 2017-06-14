function mci -d "Maven clean install, skip tests"
    mvn clean install -DskipTests $argv
end
