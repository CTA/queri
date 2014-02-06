module Queri
  class Stats
    class AnsweredCalls
      class QueuePosition < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".QPosOk"
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
