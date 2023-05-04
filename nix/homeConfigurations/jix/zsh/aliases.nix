{
  l = "exa -l";
  ll = "exa -l --git";
  tree = "exa -T";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";

  # git
  g = "git";
  ga = "git add";
  gb = "git branch";
  gc = "git commit";
  gca = "git commit --amend";
  gcm = "git commit -m";
  gco = "git checkout";
  gd = "git diff";
  gf = "git fetch";
  gfa = "git fetch --all";
  gfo = "git fetch origin";
  gl = "git log";
  glg = "git log --graph --decorate --oneline";
  gcs = "git commit -S -m";
  gpl = "git pull";
  gst = "git status";
  gsu = "git submodule update --init --recursive";
  lg = "lazygit";

  # ruby
  be = "bundle exec";
  bi = "bundle install";
  bu = "bundle update";

  # docker/orbstack
  orbc = "mv {~/.ssh,/tmp/}/id_ed25519.pub && cp -L /tmp/id_ed25519.pub ~/.ssh/ && orbctl create ubuntu -a amd64 && rm -f ~/.ssh/id_ed25519.pub && mv /tmp/id_ed25519.pub ~/.ssh/ && orb run /mnt/mac/a/jix/scripts/orbstack_ubuntu.sh";

  # apps
  c = "code";

  # make
  mi = "make install";
  mt = "make test";
}
