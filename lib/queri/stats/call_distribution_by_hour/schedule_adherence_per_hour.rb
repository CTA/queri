module Queri
  class Stats
    class CallDistributionByHour
      class ScheduleAdherencePerHour < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByHour.xml_code + ".StaffPerHr"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :hour, "Hour",
              :number_of_agents, "Agents",
              :percentage_of_all_agents_detected_within_period, "&nbsp;",
              :placeholder_for_bar_graph, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
