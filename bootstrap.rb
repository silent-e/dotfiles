#!/usr/bin/env ruby

puts 'Installing dependencies...'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'awesome_print'
  gem 'diffy'
  gem 'pastel'
  gem 'tty-command'
  gem 'tty-prompt'
  gem 'tty-spinner'
end

require_relative 'lib/bootstrap'
bootstrapper = Bootstrap.new

setup_okay = bootstrapper.check_setup
if !setup_okay
  puts 'Setup not okay'
  exit
end

if bootstrapper.changes.none?
  puts 'Nothing to do'
  exit
end

loop do
  choice = bootstrapper.ask_what_to_do

  case choice
  when 'sync'
    bootstrapper.do_sync
    break
  when 'preview'
    bootstrapper.show_diffs
  when 'exit'
    bootstrapper.stop
    break
  else
    puts 'Unknown entry.  Exiting.'
    break
  end
end
