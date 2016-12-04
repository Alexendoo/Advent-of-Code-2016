#!/usr/bin/env ruby

p ARGF
  .map(&:strip)
  .map { |line| line.partition(/\d+/) }
  .map { |(name, id, checksum)|
    [
      name
        .delete('-')
        .each_char
        .group_by { |char| name.count char }
        .sort_by { |(count)| count }
        .reverse
        .map { |(_, chars)| chars.sort.uniq.join }
        .join,
      id.to_i,
      checksum.delete('[]'),
      name.chomp('-')
    ]
  }
  .select { |(chars, _, checksum)| chars.start_with? checksum }
  .map { |(_, id, _, name)|
    [
      id,
      name.tr((?a..?z).to_a.join, (?a..?z).to_a.rotate(id).join)
    ]
  }
