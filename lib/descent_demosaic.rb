# frozen_string_literal: true

require "chunky_png"

require_relative "descent_demosaic/version"

module DescentDemosaic
  class Error < StandardError; end

  # The main class used to demosaic an image.
  class Demosaicer
    def initialize(source, destination)
      @source = source
      @destination = destination

      @input = ChunkyPNG::Image.from_file(@source)
    end

    def run
      output = ChunkyPNG::Image.new(@input.width, @input.height)

      (1..@input.height - 2).each do |row|
        (1..@input.width - 2).each do |column|
          output[column, row] = interpolate(row, column)
        end
      end

      output.save(@destination)
    end

    def interpolate(row, column)
      if row.even?
        interpolate_even(row, column)
      else
        interpolate_odd(row, column)
      end
    end

    def interpolate_even(row, column)
      if column.even?
        # a red source pixel
        interpolate_even_even(row, column)
      else
        # a green source pixel
        interpolate_even_odd(row, column)
      end
    end

    def interpolate_odd(row, column)
      if column.even?
        # a green soruce pixel
        interpolate_odd_even(row, column)
      else
        # a blue source pixel
        interpolate_odd_odd(row, column)
      end
    end

    def interpolate_even_even(row, column)
      red = ChunkyPNG::Color.r(@input[column, row])
      green = ChunkyPNG::Color.r(@input[column + 1, row])
      blue = ChunkyPNG::Color.r(@input[column + 1, row + 1])

      ChunkyPNG::Color.rgb(red, green, blue)
    end

    def interpolate_even_odd(row, column)
      red = ChunkyPNG::Color.r(@input[column + 1, row])
      green = ChunkyPNG::Color.r(@input[column, row])
      blue = ChunkyPNG::Color.r(@input[column, row + 1])

      ChunkyPNG::Color.rgb(red, green, blue)
    end

    def interpolate_odd_even(row, column)
      red = ChunkyPNG::Color.r(@input[column, row + 1])
      green = ChunkyPNG::Color.r(@input[column, row])
      blue = ChunkyPNG::Color.r(@input[column + 1, row])
      ChunkyPNG::Color.rgb(red, green, blue)
    end

    def interpolate_odd_odd(row, column)
      red = ChunkyPNG::Color.r(@input[column + 1, row + 1])
      green = ChunkyPNG::Color.r(@input[column + 1, row])
      blue = ChunkyPNG::Color.r(@input[column, row])
      ChunkyPNG::Color.rgb(red, green, blue)
    end
  end
end
