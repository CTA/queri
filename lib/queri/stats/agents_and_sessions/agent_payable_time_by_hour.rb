module Queri
  class Stats
    class AgentsAndSessions
      class AgentPayableTimeByHour < Queri::Stats
        include CompositeByHourReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AgentPayableTimeByHour"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent",
              :total_payable_session_time, "Total"
            ]
          end
        end
      end
    end
  end
end
