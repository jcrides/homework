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
  def blur(distance)
    find_ones.each do |one|
      spread(one, distance)
    end
  end

  private

  # calculates and sets ones in a cardinal direction from a pixel
  # then spreads out on the other axis
  def spread(pixel, distance)
    xforms = [{:pri => 'x', :sec => 'y', :mod => '-'},
              {:pri => 'x', :sec => 'y', :mod => '+'},
              {:pri => 'y', :sec => 'x', :mod => '-'},
              {:pri => 'y', :sec => 'x', :mod => '+'}]

    xforms.each do |xform|
      distance.times do |i|
        if xform[:pri] == 'y'
          pcoords = { :y => pixel[:y] + "#{xform[:mod]}#{i + 1}".to_i,
                      :x => pixel[:x] }
        else
          pcoords = { :x => pixel[:x] + "#{xform[:mod]}#{i + 1}".to_i,
                      :y => pixel[:y] }
        end
        set_to_one(pcoords)
        (distance - (i + 1)).times do |j|
          ['+', '-'].each do |sign|
            if xform[:sec] == 'y'
              scoords = { :y => pcoords[:y] + "#{sign}#{j + 1}".to_i,
                          :x => pcoords[:x] }
            else
              scoords = { :x => pcoords[:x] + "#{sign}#{j + 1}".to_i,
                          :y => pcoords[:y] }
            end
            set_to_one(scoords)
          end
        end
      end
    end
  end

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
image.blur 2
puts "Blurred image"
puts image
