function imcuser -d "Search for IMC users"
    ssh pnlm01 "getent passwd" | grep -iE $argv[1] | awk -F':' '{ print $1 " (" $5 ")"}'
end
