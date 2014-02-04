module Queri
  class Stats
    class CallDistributionByDayOfWeek
      class AnsweredCallDistributionPerDayOfWeek < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDayOfWeek.xml_code + ".AnsDistrPerDOW"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day_of_week, "DayOfWeek",
              :number_of_calls, "Num",
              :percentage_of_answered_calls_within_period, "&nbsp;",
              :placeholder_for_num_calls_bar_graph, "Answered calls",
              :average_call_duration, "Avg",
              :minimum_call_duration, "Min",
              :maximum_call_duration, "Max",
              :placeholder_for_call_duration_bar_graph, "Avg duration"
            ]
          end
        end
      end
    end
  end
end
