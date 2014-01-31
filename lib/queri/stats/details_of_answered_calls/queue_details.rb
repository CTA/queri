module Queri
  class Stats
    class DetailsOfAnsweredCalls
      class QueueDetails < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            DetailsOfAnsweredCalls.xml_code + ".CallsOK"
          end

          def key_translations
            Hash[
              :date, "Date",
              :caller_id, "Caller",
              :queue, "Queue",
              :wait_time, "Wait",
              :call_duration, "Duration",
              :initial_queue_position, "Pos.",
              :disconnection_cause, "Disconnection",
              :handling_agent, "Handled by",
              :number_of_agents_attempted_before_connect, "Attempts",
              :completion_code, "Code",
              :stints, "Stints",
              :server, "Srv",
              :placeholder_for_hourglass, "&nbsp;",
              :empty, "&nbsp;",
              :placeholder_for_linked_url, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
