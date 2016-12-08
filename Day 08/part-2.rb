#!/usr/bin/env ruby

board = Array.new(50) { Array.new(6, 0) }

ARGF.map(&:split).each do |args|
  case args[0]
  when 'rect'
    x, y = args[1].split(?x).map(&:to_i)
    for i in 0...x
      for j in 0...y
        board[i][j] = 1
      end
    end
  when 'rotate'
    board = board.transpose if args[1] == 'row'

    rotate = args[2].split(?=).last.to_i
    by = -args[4].to_i
    board[rotate].rotate!(by)

    board = board.transpose if args[1] == 'row'
  end
end

board.transpose.each { |row| puts row.join(' ').tr('01', ' #') }
