module Queri
  class Stats
    class CallDistributionByDay
      class ScheduleAdherencePerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".StaffPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
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
