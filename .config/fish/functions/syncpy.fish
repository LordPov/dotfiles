function syncpy
    rsync -av --exclude '.git/' --exclude '.env/' --include '+ */' --include '*.py' --include '*.html' --include '*.css' --include '*.js' --exclude '- *' ./ syofc006:(pwd | sed "s:^$HOME:~:")
end
