module Queri
  class Stats
    class DetailsOfAgentSessionsAndPauses
      class DetailOfAgentSessions < Queri::Stats
        include CompositeAgentLevelReportHelpers

        class << self
          def xml_code
            DetailsOfAgentSessionsAndPauses.xml_code + ".AgentSessions"
          end

          def key_translations
            Hash[
              :agent, "Agent",
              :clock_in, "Start hour", 
              :clock_out, "End hour", 
              :session_duration, "Duration", 
              :call_back_extension, "Ext.", 
              :termination, "Termination", 
              :number_of_pauses, "Pause", 
              :total_pause_time, "P.Time", 
              :server, "Srv"
            ]
          end
        end
      end
    end
  end
end
