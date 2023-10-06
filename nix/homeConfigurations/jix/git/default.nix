{ config, lib, pkgs, inputs, ... }: {
  home.file.".config/fish/completions/wt.fish".source = ./completions/wt.fish;
  home.file.".local/bin/wt".source = ./plugins/wt;
  home.file.".git-coauthors".source = ./git-duet/git-authors;
  home.file.".gitignore".source = ./configs/gitignore;
  home.file.".config/git/config".source = ./configs/gov.uk;
}
