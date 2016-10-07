require "active_support"
require "active_support/core_ext"
require "table_transformer/line_generator"

module TableTransformer
  class Data
    attr_reader :original, :keys
    def initialize(original:, keys: [])
      @original = if original.class.method_defined?(:keys)
                    [] << original
                  else
                    [] + original
                  end
      @keys = if keys.blank?
                @original[0].keys
              else
                keys
              end
    end

    def output
      puts output_data
    end

    def output_data
      @output_data ||=
        if string_data.present?
          output_data_given_data
        else
          "Empty set\n\n"
        end
    end

    def output_data_given_data
      [].tap do |arr|
        arr << line_generator.delimiter_line
        arr << line_generator.header_line
        arr << line_generator.delimiter_line
        string_data.each do |data|
          arr << line_generator.data_line(data)
        end
        arr << line_generator.delimiter_line
        arr << "#{string_data.size} rows in set\n\n"
      end
    end

    def string_data
      @string_data ||= [].tap do |arr|
        original.each do |data|
          transformed_data = {}.tap do |t_data|
            keys.each do |k|
              t_data[k] = data[k].to_s
            end
            break t_data
          end
          arr << transformed_data if transformed_data.present?
        end
      end
    end

    def line_generator
      @line_generator ||= LineGenerator.new(
        column_width: column_width
      )
    end

    def column_width
      @column_width ||= {}.tap do |width|
        keys.each do |k|
          width[k] = max_size[k] < k.size ? k.size :  max_size[k]
          width[k] += 2
        end
        break width
      end
    end

    def max_size
      @max_size ||= {}.tap do |size|
        keys.each do |k|
          max_data = string_data.max_by { |data| data[k].to_s.size }
          size[k] = max_data[k].to_s.size
        end
        break size
      end
    end
  end
end
