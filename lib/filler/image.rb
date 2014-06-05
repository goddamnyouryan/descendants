module Filler
  class Image

    def initialize(style)
      @style = style
      dimensions = IMAGES[style].split /x|#/
      @width = dimensions[0]
      @height = dimensions[1]
    end

    def url
      "http://lorempixel.com/#{@width}/#{@height}?#{rand(0..10000)}"
    end
  end
end
