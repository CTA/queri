module Queri
  class Stats
    class UnansweredCalls
      class EnterQueuePosition < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".QPosKo"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :initial_queue_position, "Position at enter",
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
