### AC Utils BEGIN
# NOTE A more generalized version of no subcommand
function __fish_no_subcommand -d 'Test subcommand existence'
  # Tokenize the commandline buffer of the current process up to the cursor
  for i in (commandline -opc)
    if contains -- $i $argv
      return 1
    end
  end
  return 0
end
### END

# Load all fish completions
for i in (dirname (status -f))/fish-ac.d/*.fish
  source $i
end
