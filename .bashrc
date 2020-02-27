[ -n "$PS1" ] && source ~/.bash_profile;
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/serverless.bash ] && . /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/sls.bash ] && . /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/slss.bash ] && . /Users/bjornbreckenridge/sites/au-magenum/node_modules/tabtab/.completions/slss.bash
