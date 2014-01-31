module Queri
  class Stats
    class UnansweredCalls
      class UnansweredCallsByQueue < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".UnansByQueue"
          end

          def key_translations
            Hash[
              :empty_column, "&nbsp;",
              :queue, "Queue",
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
