complete --command aws-vault \
    --arguments 'help add list rotate exec remove login' \
    --condition 'not __fish_seen_subcommand_from add list rotate exec remove login' \
    --exclusive

complete --command aws-vault \
    --condition '__fish_seen_subcommand_from exec' \
    --exclusive \
    --arguments "(aws-vault list --profiles)"
