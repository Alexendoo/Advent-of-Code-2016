#!/usr/bin/env ruby

p ARGF
  .each_line
  .map { |line| line.split.map { |num| num.to_i } }
  .each_slice(3)
  .map { |slice| slice.transpose }
  .flatten(1)
  .map { |triangle| triangle.sort }
  .count { |triangle| triangle[0] + triangle[1] > triangle[2] }
