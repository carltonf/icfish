# Part of the 'envsetup' suit

function ctop -d 'cd back to top directory'
  if __fish_envsetup_check_sourced
    return
  end
  cd $TOP
end
