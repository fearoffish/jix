set -l aichat_commands (gds --generate-bash-completion 2>/dev/null)

function __fish_gds_complete
    SHELL=zsh gds (commandline | awk '{print $2}' ) --generate-bash-completion
end

complete -c gds -xa '(__fish_gds_complete | string replace ":" \t)'
