# Include Drush prompt customizations.
. /Users/bjorn/.drush/drush.prompt.sh

# Include Drush completion.
. /Users/bjorn/.drush/drush.complete.sh

# Include Drush bash customizations.
. /Users/bjorn/.drush/drush.bashrc

source $HOME/default_drush.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="/usr/local/bin:$PATH" # Add Git to PATH for stuffs

# Amazee things
alias zin="docker-compose exec --user drupal drupal bash"
alias doc="docker-compose"
alias porter="docker-compose port drupal 3306"

#cd aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Shortcuts
alias sites="cd ~/sites"

# Show Directory tree
alias tree="tree -C --dirsfirst --filelimit 50"
alias 2tree="tree -CL 2 --dirsfirst --filelimit 50"
alias 3tree="tree -CL 3 --dirsfirst --filelimit 50"
alias 4tree="tree -CL 4 --dirsfirst --filelimit 50"

# Fuck sudo
alias fuck="sudo !!"

# prints the full path to a file, like pwd, for files
function _pwf () {
dir=$(echo $(cd $(dirname "$1"); pwd))
base=$(echo $(basename "$1"))
echo "$dir/$base"
}
alias pwf=_pwf

export EDITOR="/usr/local/bin/mate -w"
export NVM_DIR="/Users/bjorn/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Git
alias g="git"
alias s="git status"
alias gash="git stash"
alias boom="git stash pop"
alias gadd="git add -A"
alias egad="git add -A"
alias gav="git branch -av"
alias com="git commit -m '"

_drush_default() {
   echo "alias dr=\"drush$1\"" > $HOME/default_drush.sh
   source $HOME/default_drush.sh
}
alias drush_default="_drush_default"
alias default_drush="_drush_default"

# Gulp things
alias gw="gulp watch"
