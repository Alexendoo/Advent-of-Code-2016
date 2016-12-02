#!/usr/bin/env ruby

board = [
  %w(1 2 3),
  %w(4 5 6),
  %w(7 8 9)
]

x = 1
y = 1
out = ''

ARGF.each_line do |line|
  line.each_char do |char|
    case char
    when 'U'
      y = [0, y - 1].max
    when 'D'
      y = [2, y + 1].min
    when 'L'
      x = [0, x - 1].max
    when 'R'
      x = [2, x + 1].min
    end
  end
  out += board[y][x]
end

puts out