#!/usr/bin/env ruby

puts ARGF
  .grep(/^(?:\w*\[(?!(\w*(\w)(?!\2)(\w)\3\2\w*))\w*\])*\g<1>(?:\[(?!\g<1>)\w*\]\w*)*$/)
  .count
