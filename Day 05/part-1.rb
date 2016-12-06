#!/usr/bin/env ruby

require 'digest'

id = ARGF.readline.strip

puts (0..Float::INFINITY)
  .lazy
  .map { |num| id + num.to_s }
  .map { |text| Digest::MD5.hexdigest text }
  .select { |hash| hash.start_with? '00000' }
  .first(8)
  .reduce("") { |out, hash| out << hash[5] }
