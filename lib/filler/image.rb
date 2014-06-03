module Filler
  class Image

    def initialize(options)
      @height = options[:height]
      @width = options[:width]
    end

    def url
      "http://lorempixel.com/#{@width}/#{@height}?#{rand(0..10000)}"
    end
  end
end
