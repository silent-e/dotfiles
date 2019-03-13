#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'awesome_print'
  gem 'diffy'
  gem 'pastel'
  gem 'tty-command'
  gem 'tty-prompt'
end

require_relative 'lib/bootstrap'

prompt = TTY::Prompt.new
color = ::Pastel.new(enabled: true)

bootstrapper = Bootstrap.new

choices = %w[yes no list\ files preview]
choice = prompt.enum_select(color.decorate('This may overwrite existing files in your home directory. Are you sure?', :red), choices)

case choice
when 'yes'
  bootstrapper.do_sync
when 'list files'
  bootstrapper.list_files
when 'preview'
  bootstrapper.show_diffs
else
  puts color.decorate('Not doing anything', :green)
end
