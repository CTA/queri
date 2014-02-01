module Queri
  class Stats
    class UnansweredCalls
      class CallOverview < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".OverviewOkKo"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :empty, "&nbsp;",
              :queue, "Queue",
              :number_of_calls_to_hit_queue, "Calls offered",
              :calls_answered, "Calls answered",
              :calls_unanswered, "Calls lost",
              :average_call_duration, "Average call length:",
              :total_call_duration, "Total call length:",
              :average_call_waiting_time, "Average call waiting time:",
              :total_call_waiting_time, "Total waiting time:"
            ]
          end
        end
      end
    end
  end
end
