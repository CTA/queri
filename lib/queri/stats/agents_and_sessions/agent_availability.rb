module Queri
  class Stats
    class AgentsAndSessions
      class AgentAvailability < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AgentAvail"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :agent, "Agent",
              :time, "Time",
              :total_pause_time, "On pause",
              :billable_pause_time, "Billable",
              :non_billable_pause_time, "Non bill.",
              :billable_non_billable_overlap_time, "Overlapping",
              :pause_percentage_of_total_time, "&nbsp;",
              :placeholder_for_bar_graph, "..."
            ]
          end
        end
      end
    end
  end
end
