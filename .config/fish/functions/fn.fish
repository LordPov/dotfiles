function fn -d "Find files roughly matching given string"
    switch (count $argv)
    case 0 1
        find . -iname "*$argv*"
    case '*'
        find . $argv[1..-2] -iname "*$argv[-1]*"
    end
end
