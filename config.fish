# Use the same aliases as Bash
source ~/.bash_aliases

# Add back some common bash path
set -x PATH /usr/local/bin /usr/local/sbin $PATH

#### environment vars settings
# bin: icrepos binaries;
#
# xbin: mainly links or tools not meant for repo. To facilitate easily adding
# new binary path, add the first-level subdirectories.
set -x PATH $HOME/local/xbin $HOME/local/bin $PATH
for d in $HOME/local/xbin/*/
  if test -d $d
    set -x PATH $d $PATH
  end
end

# Enable gpg ssh emulation
# TODO is this still necessary
set -x SSH_AUTH_SOCK $HOME/.gnupg/S.gpg-agent.ssh

# NOTE 'vi' has been linked to 'neovim'
set -x EDITOR vi

# NOTE: `bass' has resolved the whole `nvm' issue completely.

# NOTE `RVM' and Ruby stuff is not used here for now, the same for Emacs `Cask',
# which might not be used anymore.
