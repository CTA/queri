module Queri
  class Stats
    class UnansweredCalls
      class UnansweredCallsDistributionByLength < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".UnansByLen"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :time_interval, "Hangup",
              :calls_taken_in_time_interval, "N. Calls",
              :calls_between_lower_interval, "Delta",
              :percentage_of_calls_within_interval, "Percent",
              :percentage_of_all_calls, "Of Offered",
              :placeholder_for_bar_graph, "..."
            ]
          end
        end
      end
    end
  end
end
