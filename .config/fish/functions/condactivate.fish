function condactivate -d 'Activate a conda environment' -a cenv
  # condabin will be the path to the bin directory
  # in the specified conda environment
  if test -d $HOME/miniconda3
    set condabin $HOME/miniconda3/envs/$cenv/bin
  else if test -d $HOME/miniconda
    set condabin $HOME/miniconda/envs/$cenv/bin
  else
    set condabin $HOME/anaconda/envs/$cenv/bin
  end

  # check whether the condabin directory actually exists and
  # exit the function with an error status if it does not
  if not test -d $condabin
    echo 'Environment not found.'
    return 1
  end

  # save the current path
  set -xg DEFAULT_PATH $PATH

  # put the condabin directory at the front of the PATH
  set -xg PATH $condabin $PATH

  # this is an undocumented environmental variable that influences
  # how conda behaves when you don't specify an environment for it.
  # https://github.com/conda/conda/issues/473
  set -xg CONDA_DEFAULT_ENV $cenv

  # set up the prompt so it has the env name in it
  functions -e __original_fish_prompt
  functions -c fish_prompt __original_fish_prompt
  functions -e fish_prompt
  function fish_prompt
    set_color blue
    echo -n '('$CONDA_DEFAULT_ENV') '
    set_color normal
    __original_fish_prompt
  end
end
