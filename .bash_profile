#export PATH="$HOME/.composer/vendor/bin:$PATH"

export PATH="$HOME/.composer/vendor/bin:$PATH"

#export PATH="$PATH:/usr/local/bin/yarn/yarn-0.27.5/bin"

export PATH="$PATH:`yarn global bin`"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


export PATH="/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php7.1.8/bin:$PATH"


export DRUSH_PHP=/Applications/MAMP/bin/php/php7.1.8/bin/php

alias mamp_restart="/Applications/MAMP/bin/apache2/bin/apachectl restart"

#Below Works

#Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles

default_username=‘bjorn

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    MAGENTA=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    CYAN=$(tput setaf 6)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 256)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    CYAN=$(tput setaf 6)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  CYAN="\033[1;35m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

function git_info() {
  # check if we're in a git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return

  # quickest check for what branch we're on
  branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

  # check if it's dirty (via github.com/sindresorhus/pure)
  dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

  echo $WHITE" on "$PURPLE$branch$dirty
}

# Only show username/host if not default
function usernamehost() {
  if [ $USER != $default_username ]; then echo "${MAGENTA}$USER ${WHITE}at ${ORANGE}$HOSTNAME $WHITEin "; fi
}

# iTerm Tab and Title Customization and prompt customization
# http://sage.ucsc.edu/xtal/iterm_tab_customization.html

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

PS1="\[\e]2;$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]${BOLD}\$(usernamehost)\[$CYAN\]\w\$(git_info)\[$WHITE\]\n\$ \[$RESET\]"

source $HOME/.bashrc
export PATH=/usr/local/bin:/Users/bjorn/.nvm/versions/node/v4.0.0/bin:/Applications/MAMP/Library/bin:/Applications/MAMP/bin/php/php5.6.10/bin:/Users/bjorn/.rvm/gems/ruby-2.2.1/bin:/Users/bjorn/.rvm/gems/ruby-2.2.1@global/bin:/Users/bjorn/.rvm/rubies/ruby-2.2.1/bin:/Users/bjorn/.composer/vendor/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/bjorn/.rvm/bin:/Users/bjorn/.rvm/bin
eval $(cachalot env)
