#!/usr/bin/env ruby

p ARGF
  .map { |line| line.split.map(&:to_i) }
  .map(&:sort)
  .count { |(a, b, c)| a + b > c }
