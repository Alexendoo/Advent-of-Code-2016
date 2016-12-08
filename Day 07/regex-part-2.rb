#!/usr/bin/env ruby

puts ARGF
  .grep(/(?:(?:^|\])\w*(\w)(?!\1)(\w)\1.*\[\w*\2\1\2|\[\w*(\w)(?!\3)(\w)\3.*\]\w*\4\3\4)/)
  .count
