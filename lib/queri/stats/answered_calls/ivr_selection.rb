module Queri
  class Stats
    class AnsweredCalls
      class IvrSelection < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".IvrOk"
          end

          def key_translations
            ActiveSupport::OrderedHash[
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
