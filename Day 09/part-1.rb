#!/usr/bin/env ruby

chars = ARGF.first.strip.chars
out = 0

while chars.length > 0
  char = chars.shift
  if char == '('
    length, count = chars.shift(chars.index(')') + 1).join.scan(/\d+/).map(&:to_i)
    length = chars.shift(length).length
    out += length * count
  else
    out += 1
  end
end

p out
