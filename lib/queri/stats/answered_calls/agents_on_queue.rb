module Queri
  class Stats
    class AnsweredCalls
      class AgentsOnQueue < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".AgentsOnQueue"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent",
              :number_of_calls, "N. Calls",
              :percentage_of_all_calls_handled, "&nbsp;",
              :placeholder_for_bar_graph, "...",
              :total_call_time, "Total call time",
              :average_call_time, "Average call time"
            ]
          end
        end
      end
    end
  end
end
