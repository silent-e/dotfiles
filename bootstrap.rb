#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'awesome_print'
  gem 'tty-command'
end

command = TTY::Command.new(printer: :pretty)

command.run!(:rsync, '--exclude-from=bootstrap_rsync_excludes.txt', '--dry-run', '-ia', '--no-perms', '.', File.expand_path('~')).tap do |result|
  if result.success?
    files = result.collect { |line|
      ap line
      item = line.split(' ').last
      ap item
      next if FileTest.directory?(item)
      item
    }.compact
  else
  end
  files.each do |file|
    ap "diff for #{file}"
    system("diff #{file} ~/#{file}")
  end
end


# run rsync
# loop over results
# if directory, next
# if file, show diff
