module Queri
  class Stats
    class UnansweredCalls
      class UnansweredCallsByStints < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".StintsKo"
          end

          def key_translations
            Hash[
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
