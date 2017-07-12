# TODO a more unified, well-defined form of help message that can generate fish AC.
set docker_reg_cmds (docker-reg help | awk -F: '{ print $2; }')

complete -e -c docker-reg
for cmd in $docker_reg_cmds
  complete -c docker-reg -f -n "__fish_no_subcommand $docker_reg_cmds" -a "$docker_reg_cmds" -d ''
end
