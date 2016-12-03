#!/usr/bin/env ruby

p ARGF
  .first
  .split(', ')
  .map { |e| e.split('', 2) }
  .map { |(turn, length)| [turn, length.to_i] }
  .reduce([%w(N E S W), 0, 0]) { |(direction, x, y), (turn, length)|
    [
      direction.rotate!(turn == 'R' ? 1 : -1),
      x + {N: 0, E: length, S: 0, W: -length}[direction.first.to_sym],
      y + {N: length, E: 0, S: -length, W: 0}[direction.first.to_sym]
    ]
  }
  .drop(1)
  .reduce(0) { |total, val| total + val.abs }