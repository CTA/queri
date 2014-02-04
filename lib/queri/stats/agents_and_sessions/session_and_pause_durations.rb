module Queri
  class Stats
    class AgentsAndSessions
      class SessionAndPauseDurations < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".SessionPauseDur"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :agent, "Agent",
              :number_of_sessions, "Sessions",
              :average_session_duration, "Avg Session",
              :number_of_pauses, "Pauses",
              :average_pause_duration, "Avg Pause",
              :percentage_between_pause_time_and_available_time, "Pause %",
              :number_of_pauses_per_session, "Pauses per session"
            ]
          end
        end
      end
    end
  end
end
