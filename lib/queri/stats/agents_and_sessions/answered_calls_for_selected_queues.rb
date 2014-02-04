module Queri
  class Stats
    class AgentsAndSessions
      class AnsweredCallsForSelectedQueues < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AnsCallsQueues"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :agent, "Agent",
              :number_of_calls, "N. calls",
              :total_call_time, "Total call time",
              :average_call_time, "Avg call time",
              :average_wait_time, "Avg wait time",
              :percentage_of_taken_calls_to_queue_calls, "% of queue"
            ]
          end
        end
      end
    end
  end
end
