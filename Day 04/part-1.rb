#!/usr/bin/env ruby

p ARGF
  .map(&:strip)
  .map { |line| line.delete('[]-') }
  .map { |line| line.partition(/\d+/) }
  .map { |(name, id, checksum)|
    [
      name
        .each_char
        .group_by { |char| name.count char }
        .sort_by { |(count)| count }
        .reverse
        .map { |(_, chars)| chars.sort.uniq.join }
        .join,
      id.to_i,
      checksum
    ]
  }
  .select { |(chars, _, checksum)| chars.start_with? checksum }
  .reduce(0) { |total, (_, id)| total += id }
