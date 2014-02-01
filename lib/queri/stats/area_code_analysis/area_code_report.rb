module Queri
  class Stats
    class AreaCodeAnalysis
      class AreaCodeReport < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            AreaCodeAnalysis.xml_code + ".Setup"
          end

          def key_translations
            Hash[
              :number_of_clid_digits_to_search, "Number of CLID digits to search:",
              :starting_digit_position, "Starting from position:",
              :submit_button, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
