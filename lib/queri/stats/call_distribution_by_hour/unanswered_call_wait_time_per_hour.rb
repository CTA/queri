module Queri
  class Stats
    class CallDistributionByHour
      class UnansweredCallWaitTimePerHour < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByHour.xml_code + ".UnansWaitPerHr"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :hour, "Hour",
              :number_of_calls, "Num",
              :percentage_of_unanswered_calls_within_period, "&nbsp;",
              :placeholder_for_num_calls_bar_graph, "Unanswered calls",
              :average_call_wait_time, "Avg",
              :minimum_call_wait_time, "Min",
              :maximum_call_wait_time, "Max",
              :placeholder_for_avg_wait_bar_graph, "Avg wait"
            ]
          end
        end
      end
    end
  end
end
