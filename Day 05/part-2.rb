#!/usr/bin/env ruby

require 'digest'

id = ARGF.readline.strip

p (0..Float::INFINITY)
  .lazy
  .map { |num| id + num.to_s }
  .map { |text| Digest::MD5.hexdigest text }
  .select { |hash| hash.start_with? '00000' }
  .select { |hash| hash[5] =~ /\d/ }
  .map { |hash| [hash[5].to_i, hash[6]] }
  .with_object(Array.new(8))
  .select { |(pos, char), arr|
    arr[pos] ||= char if pos < arr.length
    !arr.any?(&:nil?)
  }
  .first
  .last
  .join
