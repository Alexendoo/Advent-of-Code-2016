#!/usr/bin/env ruby

chars = ARGF.first.strip.chars.reverse
out = []

while chars.length > 0
  char = chars.pop
  if char == '('
    count, length = chars.pop(chars.length - chars.rindex(')')).join.scan(/\d+/).map(&:to_i)
    push = chars.pop(length).reverse
    count.times { out.concat push }
  else
    out.push char
  end
end

p out.length
