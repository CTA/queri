module Queri
  class Stats
    class DetailsOfAgentSessionsAndPauses
      class DetailOfAgentPauses < Queri::Stats
        include CompositeAgentLevelReportHelpers

        class << self
          def xml_code
            DetailsOfAgentSessionsAndPauses.xml_code + ".AgentPauses"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent",
              :extension, "Ext.",
              :pause_code, "Code",
              :pause_activity, "Activity",
              :pause_billable_code, "&nbsp;",
              :pause_billable, "Billable?",
              :pause_start, "Start hour",
              :pause_end, "End hour",
              :pause_duration, "Duration"
            ]
          end
        end
      end
    end
  end
end
