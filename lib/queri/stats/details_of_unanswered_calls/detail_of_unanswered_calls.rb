module Queri
  class Stats
    class DetailsOfUnansweredCalls
      class DetailOfUnansweredCalls < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            DetailsOfAnsweredCalls.xml_code + ".CallsKO"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :date, "Date",
              :agent, "Agent",
              :caller_id, "Caller",
              :queue, "Queue",
              :disconnection_cause, "Disconnection",
              :queue_position_at_disconnection, "Position", 
              :wait_time, "Wait",
              :initial_queue_position, "Pos.",
              :number_of_agents_attempted_before_connect, "Attempts",
              :completion_code, "Code",
              :key_pressed_on_disconnection, "Key",
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
