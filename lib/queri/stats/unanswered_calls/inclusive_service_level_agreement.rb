module Queri
  class Stats
    class UnansweredCalls
      class InclusiveServiceLevelAgreement < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".InclusiveSLA"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :time_interval, "Hangup",
              :calls_taken_in_time_interval, "N. Calls",
              :calls_between_lower_interval, "Delta",
              :percentage_of_calls_within_interval, "Percent",
              :placeholder_for_bar_graph, "..."
            ]
          end
        end
      end
    end
  end
end
