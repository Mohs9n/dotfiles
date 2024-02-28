if status is-interactive
    # Commands to run in interactive sessions can go here
    bind yy fish_clipboard_copy
    bind y fish_clipboard_copy
    bind p fish_clipboard_paste
end

set fish_greeting
set -gx GO_PATH '/home/mohsen/go'
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x EDITOR 'nvim'
# set -U fish_user_paths /home/mohsen/.ghcup/bin /home/mohsen/.cabal/bin
rtx activate fish | source

# opam configuration
source /home/mohsen/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

zoxide init fish | source
