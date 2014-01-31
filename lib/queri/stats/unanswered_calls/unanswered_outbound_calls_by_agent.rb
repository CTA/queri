module Queri
  class Stats
    class UnansweredCalls
      class UnansweredOutboundCallsByAgent < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".OutboundKo"
          end

          def key_translations
            Hash[
              :agent, "Agent",
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
