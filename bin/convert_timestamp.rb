#!/usr/bin/env ruby

# gems
require 'date'
require 'rubygems'
require 'awesome_print'

timestamp = ARGV[0]
time = Time.at(timestamp.to_i)

puts time.strftime("%A, %B %e, %Y")
puts time.strftime("%c")
