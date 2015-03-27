#!/usr/bin/env ruby

class Image

  def initialize(image)
    @image = image
  end

  # loop through the rows and print them joined
  def output_image
    @image.each { |row| puts row.join }
  end

  # can be to_s
  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
