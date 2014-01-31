module Queri
  class Stats
    class AnsweredCalls
      class ServiceLevelAgreement < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".ServiceLevelAgreement"
          end

          def key_translations
            Hash[
              :time_interval, "Answer",
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
