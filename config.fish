# Use the same aliases as Bash
source ~/.bash_aliases

# See ~/.bashrc for notes
set -x LS_COLORS 'ow=01;90:di=01;90:ex=00;32:'

# System-wide local path
set -x PATH $HOME/.local/bin /usr/local/bin /usr/local/sbin $PATH

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
set VLESS (find /usr/share/nvim -name 'less.sh' 2>/dev/null)
if test ! -z $VLESS
  alias vless=$VLESS
end

# My own Fish AutoCompletions
source (dirname (status -f))/ac.fish

# NOTE: `bass' has resolved the whole `nvm' issue completely.

# NOTE `RVM' and Ruby stuff is not used here for now, the same for Emacs `Cask',
# which might not be used anymore.

function my_fish_git_disable -d 'Disable fish git prompt to avoid performance penalty'
  # Currently __fish_git_prompt invoking git command multiple times to get various
  # information, which is super slow on large project like ceph, disable them for
  # now.
  #
  set __fish_git_prompt_show_informative_status ''
  set __fish_git_prompt_showdirtystate ''
  # NOTE: this might not affect any performance
  # set __fish_git_prompt_showstashstate ''
  set __fish_git_prompt_showuntrackedfiles ''
  set __fish_git_prompt_showupstream ''
  # }}
end

