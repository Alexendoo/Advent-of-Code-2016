#!/usr/bin/env ruby

p ARGF
  .map { |line| line.split.map(&:to_i) }
  .each_slice(3)
  .map(&:transpose)
  .flatten(1)
  .map(&:sort)
  .count { |(a, b, c)| a + b > c }
