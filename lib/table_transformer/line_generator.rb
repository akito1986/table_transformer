require "table_transformer/helper"

module TableTransformer
  class LineGenerator
    include Helper
    attr_reader :column_width
    def initialize(column_width:)
      @column_width = column_width
    end

    def delimiter_line
      @delimiter_line ||= "+".tap do |line|
        column_width.each do |k, v|
          line += "-" * v + "+"
        end
        break line
      end
    end

    def header_line
      @header_line ||= generate_line(header_data)
    end

    def data_line(data)
      generate_line(data)
    end

    private

    def header_data
      {}.tap do |data|
        column_width.each do |k,|
          data[k] = k
        end
        break data
      end
    end

    def generate_line(data)
      "|".tap do |line|
        column_width.each do |k, v|
          blank_number = v - width(data[k]) - 1
          line += " " + data[k].to_s + " " * blank_number + "|"
        end
        break line
      end
    end
  end
end
