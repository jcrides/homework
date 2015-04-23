#!/usr/bin/env ruby

class Image

  def initialize(image)
    # save image data to instance variable and calculate boundaries
    @image = image
    @max_x = @image[0].size - 1
    @max_y = @image.size - 1
  end

  # join all the rows separated by newlines
  def to_s
    @image.map { |row| row.join }.join("\n")
  end

  # set pixels left, right, up and down of a '1' to 1 unless out of bounds
  def blur
    xforms = [{ :x => -1, :y =>  0 },
              { :x =>  1, :y =>  0 },
              { :x =>  0, :y => -1 },
              { :x =>  0, :y =>  1 }]
    find_ones.each do |one|
      xforms.each do |xform|
        coords = { :y => one[:y] + xform[:y], :x => one[:x] + xform[:x] }
        set_to_one(coords)
      end
    end
  end

  private

  # returns an array with coordinates of the 1's
  def find_ones
    ones_arr = []

    @image.each_index do |row|
      @image[row].each_index do |column|
        if @image[row][column] == 1
          ones_arr << { :x => column, :y => row }
        end
      end
    end
    return ones_arr
  end

  # checks if pixel to set within bounds and sets to 1
  def set_to_one(coords)
    if (0..@max_x).include?(coords[:x]) && (0..@max_y).include?(coords[:y])
      @image[coords[:y]][coords[:x]] = 1
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

puts "Start image"
puts image
puts "Blurring"
image.blur
puts "Blurred image"
puts image
