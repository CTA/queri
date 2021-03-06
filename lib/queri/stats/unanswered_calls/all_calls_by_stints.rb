module Queri
  class Stats
    class UnansweredCalls
      class AllCallsByStints < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".StintsOkKo"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :number_of_stints, "Number of stints",
              :number_of_calls, "N. Calls",
              :percentage_of_calls, "&nbsp;",
              :placeholder_for_bar_graph, "..."
            ]
          end
        end
      end
    end
  end
end
