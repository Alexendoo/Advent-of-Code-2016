#!/usr/bin/env ruby

puts ARGF
  .map(&:strip)
  .map { |line| line.split('') }
  .transpose
  .map { |column| column.group_by(&:itself).values.min_by(&:size).first }
  .join
