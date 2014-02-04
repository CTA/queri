module Queri
  class Stats
    class AgentsAndSessions
      class AgentPerformanceByAcdGroup < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".PerformanceAcdGroups"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :agent, "Agent",
              :session_login_time, "Login",
              :session_duration, "Dur.",
              :number_of_inbound_calls, "Calls in",
              :number_of_outbound_calls, "Calls out",
              :total_calls_processed, "Tot calls",
              :average_talk_time_for_inbound_calls, "Avg in",
              :average_talk_time_for_outbound_calls, "Avg out",
              :average_talk_time, "Avg dur",
              :percentage_of_idle_time, "Avail.",
              :percentage_of_time_on_inbound_calls, "On call in",
              :percentage_of_time_on_outbound_calls, "On call out",
              :percentage_of_time_on_a_billable_pause, "Pau Bill",
              :percentage_of_time_on_a_nonbillable_pause, "Pau N/Bill"
            ]
          end
        end
      end
    end
  end
end
