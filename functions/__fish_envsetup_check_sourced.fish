# Ancilloary functions for 'envsetup' scripts.
#
# Prefixed with `__fish_envsetup`
#
# NOTE: all 'tool/envsetup.fish' should have the following as the first line
# set TOP (realpath (dirname (status -f))/../)

function __fish_envsetup_check_sourced
  if test -z "$TOP"
    echo "Error: you need to source envsetup.fish first."
    return 1;
  end
end
