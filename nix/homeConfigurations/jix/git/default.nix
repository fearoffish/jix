{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Jamie van Dyke";
    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        side-by-side = false;
        syntax-theme = "GitHub";
      };
    };
    ignores = [".DS_Store" "*.swp" ".overcommit.yml" ".projectile" ".tool-versions"];
    includes = [
      {
        path = "~/a/gov.uk/.gitconfig";
        condition = "gitdir:/a/gov.uk/";
      }
      {
        path = "~/a/.gitconfig";
        condition = "gitdir:/a/";
      }
      {path = "/a/gov.uk/.git-together";}
    ];
    extraConfig = {
      user.useConfigOnly = true;
      init = {defaultBranch = "main";};
      pager.difftool = true;
      diff.tool = "difftastic";
      difftool.prompt = false;
      difftool.difftastic.cmd = "${pkgs.difftastic}/bin/difft $LOCAL $REMOTE";

      merge.tool = "Kaleidoscope";
      mergetool.Kaleidoscope.cmd = ''
        /usr/local/bin/ksdiff --merge --output "$MERGED" --base "$BASE" -- "$LOCAL" --snapshot "$REMOTE" --snapshot'';
      mergetool.trustExitCode = true;

      github.user = "fearoffish";
      gitlab.user = "fearoffish";
      pull.ff = "only";
      push.autoSetupRemote = true;

      git-mob-config.github-fetch = true;
    };
    aliases = {
      # View abbreviated SHA, description, and history graph of the latest 20 commits
      l = "log --pretty=oneline -n 20 --graph --abbrev-commit";

      # View the current working tree status using the short format
      s = "status -s";

      # Show the diff between the latest commit and the current state
      d = ''
        !"git diff-index --quiet HEAD -- || clear; git --no-pager diff --patch-with-stat"'';

      # `git di $number` shows the diff between the state `$number` revisions ago and the current state
      di = ''
        !"d() { git diff --patch-with-stat HEAD~$1; }; git diff-index --quiet HEAD -- || clear; d"'';

      # Color graph log view
      graph = ''
        log --graph --color --pretty=format:"%C(yellow)%H%C(green)%d%C(reset)%n%x20%cd%n%x20%cn%x20(%ce)%n%x20%s%n"'';

      # clean a git repo and submodules
      rinse = "!git reset --hard --recurse-submodule && git submodule sync --recursive && git submodule update --init --force --recursive && git clean -ffdx && git submodule foreach --recursive git clean -ffdx";

      # submodules update and init recursive
      suri = "submodule update --init --recursive --force";
      # submodules update with merge
      supdate = "submodule update --remote --merge";

      # diff with submodules
      sdiff = '''!'"git diff && git submodule foreach 'git diff'"'';

      # push with submodules
      spush = "push --recurse-submodules=on-demand";
    };
  };

  home.file.".config/fish/completions/wt.fish".source = ./completions/wt.fish;
  home.file.".local/bin/wt".source = ./plugins/wt;
  home.file."a/.gitconfig".source = ./configs/personal;
  home.file."a/gov.uk/.gitconfig".source = ./configs/gov.uk;
}
