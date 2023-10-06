{ config, lib, pkgs, inputs, ... }: {
  home.file.".config/fish/completions/wt.fish".source = ./completions/wt.fish;
  home.file.".local/bin/wt".source = ./plugins/wt;
  home.file."a/gov.uk/.gitconfig".source = ./configs/gov.uk;
  home.file.".git-coauthors".source = ./git-duet/git-authors;
  # home.file.".config/git/config".source = ./configs/global;
}
