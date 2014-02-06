module Queri
  class Stats
    class CallDistributionByDay
      class UnansweredCallWaitTimePerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".UnansWaitPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
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
