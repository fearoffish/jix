#!/usr/bin/env ruby
#
# Convert a Starship toml file to a home manager settings block

require 'tomlrb'
require 'erb'
require 'pp'

# {"format"=>"[](#9A348E)$os$username[](bg:#DA627D fg:#9A348E)$directory[](fg:#DA627D bg:#FCA17D)$git_branch$git_status[](fg:#FCA17D bg:#86BBD8)$c$elixir$elm$golang$haskell$java$julia$nodejs$nim$rust$scala[](fg:#86BBD8 bg:#06969A)$docker_context[](fg:#06969A bg:#33658A)$time[ ](fg:#33658A)",
#  "username" => {
#   "show_always"=>true,
#   "style_user"=>"bg:#9A348E", "style_root"=>"bg:#9A348E", "format"=>"[$user ]($style)", "disabled"=>false
#   },

stdin = $stdin.read
toml = Tomlrb.parse(stdin)

template_file = File.join(__dir__, 'settings.nix.erb')
template = ERB.new(File.read(template_file), trim_mode: '-')

settings_file = File.join(__dir__, '../settings.nix')
File.write(settings_file, template.result(binding))
