# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# NOTE designed to be used together with envsetup.fish
function __fish_prompt_status -d 'indicating the current status (default to hostname)'
  echo (hostname)
end

function __fish_printf_status -a prt -d 'printf status only when there is output, avoid excessive whitespace'
  if test -n "$prt"
    printf '%s ' "$prt"
  else
    printf ''
  end
end

function __fish_extra_status -d 'overriding this function to show extra status'
  # python venv
  # Also add this following to $VIRTUAL_ENV/bin/activate.fish
  # set -x VIRTUAL_ENV_DISABLE_PROMPT y
  if test -n "$VIRTUAL_ENV"
    printf "%s(%s)%s" (set_color -b blue white) (basename "$VIRTUAL_ENV") (set_color normal)
  else
    printf ''
  end 
end

function fish_prompt
  set last_status $status
  printf '%s\n' (printf %"$COLUMNS"s | tr " " "_")
  printf '[%s %s] ' (date +%X) (date +%x)
  set_color $fish_color_cwd
  printf '%s\n' (pwd)
  set_color blue
  printf '[%s] ' (__fish_prompt_status)
  set_color cyan
  __fish_printf_status (__fish_extra_status)
  set_color normal
  __fish_printf_status (__fish_git_prompt)
  printf '$ '
end
