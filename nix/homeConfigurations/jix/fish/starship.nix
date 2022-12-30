{
  enable = true;
  enableFishIntegration = true;
  enableZshIntegration = true;
  settings = {
    command_timeout = 2000;
    format = "$username$hostname$shlvl$vcsh$directory$git_branch$git_commit$git_state$git_metrics$git_status$nix_shell$custom$cmd_duration$line_break$jobs$time$status$shell$character";
    git_status = {
      conflicted = "!![CONFLICTS $count]";
      ahead = "⇡$count";
      behind = "⇣$count";
      diverged = "⇕⇡$ahead_count⇣$behind_count";
      untracked = "?$count";
      stashed = "";
      modified = "%$count";
      staged = "+$count";
      renamed = "»$count";
      deleted = "✘$count";
    };
  };
}
