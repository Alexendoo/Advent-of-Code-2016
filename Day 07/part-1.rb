#!/usr/bin/env ruby

def abba?(string)
  string.each_char
    .each_cons(4)
    .any? { |x| x[0] == x[3] && x[1] == x[2] && x[0] != x[1] }
end

p ARGF
  .map { |line| line.scan /\w+/ }
  .map { |ip| ip.partition.with_index { |_, i| i.even? } }
  .reject { |(_, hypernets)| hypernets.any?(&method(:abba?)) }
  .select { |(regulars)| regulars.any?(&method(:abba?)) }
  .count
