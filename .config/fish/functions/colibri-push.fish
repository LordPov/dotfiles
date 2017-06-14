function colibri-push -d "Push Colibri code to build host syoffc06"
    rsync -av --delete $HOME/data/colibri syoffc06:~/data/
end
