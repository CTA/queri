module Queri
  class Stats
    class UnansweredCalls
      class IvrSelection < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".IvrKo"
          end

          def key_translations
            Hash[
              :ivr_selection, "IVR",
              :number_of_calls, "N. Calls",
              :percentage_of_calls, "&nbsp;",
              :placeholder_for_bar_graph, "...",
              :total_duration_of_call_in_ivr, "Total Duration",
              :average_duration_of_call_in_ivr, "Average Duration",
              :minimum_duration_of_call_in_ivr, "Min Duration",
              :maximum_duration_of_call_in_ivr, "Max Duration"
            ]
          end
        end
      end
    end
  end
end
