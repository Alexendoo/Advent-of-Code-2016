#!/usr/bin/env ruby

p ARGF
  .map { |line| line.split.map { |num| num.to_i } }
  .map { |triangle| triangle.sort }
  .count { |triangle| triangle[0] + triangle[1] > triangle[2] }
