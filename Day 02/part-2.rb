#!/usr/bin/env ruby

board = [
  %w(_ _ _ _ _ _ _),
  %w(_ _ _ 1 _ _ _),
  %w(_ _ 2 3 4 _ _),
  %w(_ 5 6 7 8 9 _),
  %w(_ _ A B C _ _),
  %w(_ _ _ D _ _ _),
  %w(_ _ _ _ _ _ _)
]

x = 1
y = 3
out = ''

ARGF.each_line do |line|
  line.each_char do |char|
    case char
    when 'U'
      y -= 1 unless board[y - 1][x].eql? '_'
    when 'D'
      y += 1 unless board[y + 1][x].eql? '_'
    when 'L'
      x -= 1 unless board[y][x - 1].eql? '_'
    when 'R'
      x += 1 unless board[y][x + 1].eql? '_'
    end
  end
  out += board[y][x]
end

puts out