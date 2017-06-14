function ipnb -d "Starts IPython Notebook"
    ipython notebook --notebook-dir=$HOME/Notebooks "*$argv*"
end
