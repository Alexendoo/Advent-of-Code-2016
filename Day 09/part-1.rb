#!/usr/bin/env ruby

chars = ARGF.first.strip.chars
out = []

while chars.length > 0
  char = chars.shift
  if char == '('
    length, count = chars.shift(chars.index(')') + 1).join.scan(/\d+/).map(&:to_i)
    repeat = chars.shift(length)
    count.times { out.concat repeat }
  else
    out.push char
  end
end

p out.length
