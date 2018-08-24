function deactivate -d 'Deactivate a conda environment'
  # set PATH back to its default before activating the conda env
  set -xg PATH $DEFAULT_PATH
  set -e DEFAULT_PATH

  # unset this so that conda behaves according to its default behavior
  set -e CONDA_DEFAULT_ENV

  # reset to the original prompt
  functions -e fish_prompt
  functions -c __original_fish_prompt fish_prompt
  functions -e __original_fish_prompt
end
