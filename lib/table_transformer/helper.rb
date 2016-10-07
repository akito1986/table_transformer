require "unicode/display_width"

module TableTransformer
  module Helper
    def width(str)
      Unicode::DisplayWidth.of(str.to_s)
    end
  end
end
