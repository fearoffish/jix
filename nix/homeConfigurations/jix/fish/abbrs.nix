{
  ls = "exa";
  top = "btm";
  cat = "bat";
  grep = "rg";
  find = "fd";
  watch = "viddy";
  nr = "nix run";
  nf = "fd --glob '*.nix' -X nixfmt {}";
  gr = "git recents";
  gc = "git commit";
  gb = "git branch";
  gd = "git dff";
  gs = "git status";
  gco = "git checkout";
  gcb = "git checkout -b";
  gcs = "git commit -S -m";
  gp = "git pull --rebase --no-commit";
  gz = "git stash";
  gza = "git stash apply";
  gpo = "git push origin";
  gfp = "git push --force-with-lease";
  gfap = "git fetch --all -p";
  groh = "git rebase remotes/origin/HEAD";
  grih = "git rebase -i remotes/origin/HEAD";
  grom = "git rebase remotes/origin/master";
  grim = "git rebase -i remotes/origin/master";
  gpfh = "git push --force-with-lease origin HEAD";
  gfix = "git commit --all --fixup amend:HEAD";
  gcm = "git commit --message";
  ga = "git commit --amend --reuse-message HEAD --all";
  gcam = "git commit --amend --all --message";
  gbDm = "git rm-merged";
  glo = "git log --graph --oneline";
  gss = "git status";
  greset = "git reset --hard origin/main";
  # Magit
  ms = "mg SPC g g";
  # status
  mc = "mg SPC g / c";
  # commit
  md = "mg SPC g / d u";
  # diff unstaged
  ml = "mg SPC g / l l";
  tig = "mg SPC g / l l";
  # log
  mr = "mg SPC g / r i";
  # rebase interactive
  mz = "mg SPC g / Z l";
  # list stash

  jinstall = "cd /a/personal/jix && make install ; cd -";
  # gh = "op plugin run -- gh";
  gaws = "op plugin run -- aws";
  sshpw = "ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password";
  lg = "lazygit";

  # work stuff
  cfli = "cf login -a api.cloud.service.gov.uk --sso";
  cfll = "cf login -a api.london.cloud.service.gov.uk --sso";
  cfls = "cf login -a api.london.staging.cloudpipeline.digital --sso";
  cfld1 = "cf login -a api.dev01.dev.cloudpipeline.digital --sso";
  cfld2 = "cf login -a api.dev02.dev.cloudpipeline.digital --sso";
  cfld3 = "cf login -a api.dev03.dev.cloudpipeline.digital --sso";
  cfld4 = "cf login -a api.dev04.dev.cloudpipeline.digital --sso";
  cfld5 = "cf login -a api.dev05.dev.cloudpipeline.digital --sso";

  # rubygems
  gemi = "gem install";
  gemu = "gem update";

  # jcf = "orbstack run -it --rm ruby:3.3 bash -c \"gem install jcf && jcf";
}
