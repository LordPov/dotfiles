function mdeps -d "Show Maven dependency tree"
    mvn dependency:tree -Dverbose $argv
end
