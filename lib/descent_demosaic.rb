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
    end

    def run
      image = ChunkyPNG::Image.from_file(@source)
      image.save(@destination)
    end
  end
end
