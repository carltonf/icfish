# Use the same aliases as Bash
source ~/.bash_aliases

# System-wide local path
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

# NOTE 'vi' has been linked to 'neovim'
#
# NOTE vim's less.sh can frequently suspended into the background and need to
# be brought up with `fg`. It's also slower than vanilla less, so make it a
# different name as colorful output is not always needed.
set -x EDITOR vi
set VLESS (find /usr/share/nvim -name 'less.sh')
if test ! -z $VLESS
  alias vless=$VLESS
end

# NOTE: `bass' has resolved the whole `nvm' issue completely.

# NOTE `RVM' and Ruby stuff is not used here for now, the same for Emacs `Cask',
# which might not be used anymore.
