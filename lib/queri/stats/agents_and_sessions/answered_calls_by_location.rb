module Queri
  class Stats
    class AgentsAndSessions
      class AnsweredCallsByLocation < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AnsCallsLocation"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :location, "Location",
              :number_of_answered_calls_for_location, "N. calls",
              :total_call_time_for_location, "Total call time",
              :average_call_time_for_location, "Avg call time",
              :average_wait_time_for_location, "Avg wait time",
              :percentage_of_taken_calls_to_queue_calls_for_location, "% of queue"
            ]
          end
        end
      end
    end
  end
end
