#!/usr/bin/env ruby

require 'set'

direction = %w(N E S W)
x = 0
y = 0
visited = Set.new [[0, 0]]

ARGF
  .first
  .split(', ')
  .map { |e| e.split('', 2) }
  .map { |(turn, length)| [turn, length.to_i] }
  .each do |(turn, length)|
    direction.rotate!(turn == 'R' ? 1 : -1)
    length.times do
      case direction.first
        when 'N' then y += 1
        when 'E' then x += 1
        when 'S' then y -= 1
        when 'W' then x -= 1
      end
      if visited.add?([x, y]).nil?
        p x.abs + y.abs
        exit
      end
    end
  end
