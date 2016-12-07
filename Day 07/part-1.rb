#!/usr/bin/env ruby

class String
  def abba?
    self.match /(.)(?!\1)(.)\2\1/
  end
end

p ARGF
  .map { |line| line.scan /\w+/ }
  .map { |ip| ip.partition.with_index { |_, i| i.even? } }
  .reject { |(_, hypernets)| hypernets.any?(&:abba?) }
  .select { |(regulars)| regulars.any?(&:abba?) }
  .count
