module Queri
  class Stats
    class AgentsAndSessions
      class AgentOccupancyReport < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AgentOccupancy"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :agent, "Agent",
              :total_session_duration, "Sessions",
              :time_on_billable_pause, "Pau Bill",
              :time_on_nonbillable_pause, "Pau N/Bill",
              :total_pause_duration, "Pauses",
              :billable_non_billable_overlap_time, "Overlapping",
              :total_talk_time, "Total call time",
              :talk_time_to_session_time_plus_pause_time, "Occupancy %"
            ]
          end
        end
      end
    end
  end
end
