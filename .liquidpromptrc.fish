
####################################
# LIQUID PROMPT CONFIGURATION FILE #
####################################

# If you want to use different themes and features,
# you can load the corresponding files here:
#source ~/code/liquidprompt/nojhan.theme
#LP_PS1_FILE "~/code/liquidprompt/nojhan.ps1"

#############
# BEHAVIOUR #
#############

# Maximal value under which the battery level is displayed
# Recommended value is 75
set -x LP_BATTERY_THRESHOLD 75

# Minimal value after which the load average is displayed
# Recommended value is 60
set -x LP_LOAD_THRESHOLD 60

# Minimal value after which the temperature is displayed (in celsius degrees)
# Recommended value is 60
set -x LP_TEMP_THRESHOLD 60

# The maximum percentage of the screen width used to display the path
# Recommended value is 35
set -x LP_PATH_LENGTH 35

# How many directories to keep at the beginning of a shortened path
# Recommended value is 2
set -x LP_PATH_KEEP 2

# Do you want to display the hostname, even if not connected through network?
# Defaults to 0 (do not display hostname when localy connected)
# set to 1 if you want to always see the hostname
set -x LP_HOSTNAME_ALWAYS 0

# Do you want to display the user, even if he is the same than the logged one?
# Defaults to 1 (always display the user)
# set to 0 if you want to hide the logged user (it will always display different users)
set -x LP_USER_ALWAYS 1

# Do you want to display the percentages of load/batteries along with their
# corresponding marks? Set to 0 to only print the colored marks.
# Defaults to 1 (display percentages)
set -x LP_PERCENTS_ALWAYS 1

# Do you want to use the permissions feature ?
# Recommended value is 1
set -x LP_ENABLE_PERM 1

# Do you want to use the shorten path feature ?
# Recommended value is 1
set -x LP_ENABLE_SHORTEN_PATH 1

# Do you want to use the proxy detection feature ?
# Recommended value is 1
set -x LP_ENABLE_PROXY 1

# Do you want to use the jobs feature ?
# Recommended value is 1
set -x LP_ENABLE_JOBS 1

# Do you want to use the load feature ?
# Recommended value is 1
set -x LP_ENABLE_LOAD 1

# Do you want to use the batt feature ?
# Recommended value is 1
set -e LP_ENABLE_BATT 

# Do you want to use vcs features with root account
# Recommended value is 0
set -x LP_ENABLE_VCS_ROOT 0

# Do you want to use the git special features ?
# Recommended value is 1
set -x LP_ENABLE_GIT 1

# Do you want to use the svn special features ?
# Recommended value is 1
set -e LP_ENABLE_SVN

# Do you want to use the mercurial special features ?
# Recommended value is 1
set -e LP_ENABLE_HG 

# Do you want to use the fossil special features ?
# Recommended value is 1
set -e LP_ENABLE_FOSSIL 

# Do you want to use the bzr special features ?
# Recommanded value is 1
set -e LP_ENABLE_BZR 

# Show time of the last prompt display
# Recommended value is 0
set -x LP_ENABLE_TIME 0

# Display the virtualenv that is currently activated, if any
# Recommended value is 1
set -x LP_ENABLE_VIRTUALENV 1

# Show average system temperature
set -e LP_ENABLE_TEMP 

# When showing time, use an analog clock instead of numeric values.
# The analog clock is "accurate" to the nearest half hour.
# You must have a unicode-capable terminal and a font with the "CLOCK"
# characters.
# Recommended value is 0
set -x LP_TIME_ANALOG 0

# Use the liquid prompt as the title of the terminal window
# This may not work properly on exotic terminals, thus the
# recommended value is 0
# See LP_TITLE_OPEN and LP_TITLE_CLOSE to change escape characters to adapt this
# feature to your specific terminal.
set -x LP_ENABLE_TITLE 0

# Enable Title for screen and byobu
set -x LP_ENABLE_SCREEN_TITLE 0

# Use differents colors for differents hosts you SSH in
set -x LP_ENABLE_SSH_COLORS 1

# Specify a list of complete and colon (":") separated paths in which, all vcs
# will be disabled
set -x LP_DISABLED_VCS_PATH ""

# vim: set et sts 4 sw 4 tw 120 ft sh:
