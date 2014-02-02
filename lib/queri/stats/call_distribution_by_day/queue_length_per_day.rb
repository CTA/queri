module Queri
  class Stats
    class CallDistributionByDay
      class QueueLengthPerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".QPosPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
              :average_queue_length_during_period, "Avg",
              :placeholder_for_length_avg_bar_graph, "&nbsp;",
              :minimum_queue_length, "Min",
              :maximum_queue_length, "Max",
              :another_bar_graph, "&nbsp;",
              :coverage_percentage, "Cover.",
              :rate_of_throughput_per_hour, "Steps",
              :empty, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
