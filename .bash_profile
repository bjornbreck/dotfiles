# Add `~/bin` to the `$PATH`
export PATH="/usr/local/bin:$PATH" # Add Git to PATH for stuffs
export PATH="/Users/bjornbreckenridge/apache-maven-3.6.2/bin:$PATH"
export PATH="/Users/bjornbreckenridge/.jenv/bin:$PATH"
eval "$(jenv init -)"
#export PATH="$HOME/.composer/vendor/bin:$PATH"
#export PATH="$(yarn global bin):$PATH"
#export PATH="$PATH:`pwd`/flutter/bin"
#export PATH="$PATH:/usr/local/bin/yarn"
#export PATH="$PATH:`yarn global bin`"
# PATH="$(composer config home)/vendor/bin:$PATH"

export PATH=~/.npm-global/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Not sure if I need this
# [[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH


  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
