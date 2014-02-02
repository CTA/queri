module Queri
  class Stats
    class CallDistributionByDay
      class AnsweredCallWaitTimePerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".AnsWaitPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
              :number_of_calls, "Num",
              :percentage_of_answered_calls_within_period, "&nbsp;",
              :placeholder_for_num_calls_bar_graph, "Answered calls",
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
