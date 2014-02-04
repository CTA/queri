module Queri
  class Stats
    class CallDistributionByDayOfWeek
      class ScheduleAdherencePerDayOfWeek < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDayOfWeek.xml_code + ".StaffPerDOW"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day_of_week, "DayOfWeek",
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
