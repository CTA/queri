module Queri
  class Stats
    class AgentsAndSessions
      class AgentSessionDetail < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".ReportAgents"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :number_of_available_agents, "N. of agents available:",
              :average_agent_available_time, "Average agent time:",
              :minimum_agent_available_time, "Min agent time:",
              :maximum_agent_available_time, "Max agent time:",
              :total_agent_available_time, "Total agent time:"
            ]
          end
        end
      end
    end
  end
end
