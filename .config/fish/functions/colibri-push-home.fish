function colibri-push-home -d "Push Colibri code to home server"
    rsync -av --delete $HOME/data/colibri lordpov.com::~/
end
