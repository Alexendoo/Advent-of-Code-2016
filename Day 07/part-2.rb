#!/usr/bin/env ruby

class String
  def each_aba
    self.each_char
      .each_cons(3)
      .select { |x| x[0] == x[2] && x[0] != x[1] }
  end
end

p ARGF
  .map { |line| line.scan /\w+/ }
  .map { |ip| ip.partition.with_index { |_, i| i.even? } }
  .select { |(regulars, hypernets)|
    regulars.flat_map(&:each_aba).any? { |aba|
      hypernets.any? { |hypernet| hypernet.include? aba[1] + aba[0] + aba[1] }
    }
  }
  .count
