module Queri
  class Stats
    class AgentsAndSessions
      class AnsweredCallsByCustomGroup < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AnsCallsCG"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent_group, "Agent groups",
              :empty, "&nbsp;",
              :number_of_answered_calls_by_agent_group, "N. calls",
              :total_talk_time_for_agent_group, "Total call time",
              :average_talk_time_for_agent_group, "Avg call time",
              :percentage_of_taken_calls_to_queue_calls_by_agent_group, "% of queue"
            ]
          end
        end
      end
    end
  end
end
