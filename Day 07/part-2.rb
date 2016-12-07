#!/usr/bin/env ruby

class String
  def each_aba
    self.each_char
      .each_cons(3)
      .select { |(a, b, c)| a == c && a != b }
  end
end

p ARGF
  .map { |line| line.scan /\w+/ }
  .map { |ip| ip.partition.with_index { |_, i| i.even? } }
  .select { |(regulars, hypernets)|
    regulars.flat_map(&:each_aba).any? { |(a, b)|
      hypernets.any? { |hypernet| hypernet.include? b + a + b }
    }
  }
  .count
