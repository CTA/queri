module Queri
  class Stats
    class AgentsAndSessions
      class AgentSessionTimeByHour < Queri::Stats
        include CompositeByHourReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AgentBillableTimeByHour"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent",
              :total_session_duration, "Total"
            ]
          end
        end
      end
    end
  end
end
