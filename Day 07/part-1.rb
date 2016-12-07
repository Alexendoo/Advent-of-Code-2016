#!/usr/bin/env ruby

class String
  def abba?
    self.each_char
      .each_cons(4)
      .any? { |(a, b, c, d)| a == d && b == c && a != b }
  end
end

p ARGF
  .map { |line| line.scan /\w+/ }
  .map { |ip| ip.partition.with_index { |_, i| i.even? } }
  .reject { |(_, hypernets)| hypernets.any?(&:abba?) }
  .select { |(regulars)| regulars.any?(&:abba?) }
  .count
