#!/usr/bin/env ruby

class Image

  def initialize(image)
    @image = image
  end

  # join all the rows separated by newlines
  def to_s
    @image.map { |row| row.join }.join("\n")
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

puts image
