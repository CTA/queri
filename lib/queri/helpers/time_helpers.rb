module Queri
  module Helpers
    module TimeHelpers
      def self.time_string_to_seconds time_string
        base_60_digits = time_string[ (time_string.index(/\d/))..-1 ].split(?:).reverse.map(&:to_i)
        base_60_digits.map.with_index {|d,i| d * (60 ** i)}.reduce(:+)
      end
    end
  end
end
