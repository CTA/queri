module Queri
  class Stats
    class AnsweredCalls
      class MusicOnHoldByAgent < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".MOHOk"
          end

          def key_translations
            Hash[
              :agent, "Agent",
              :total_hold_events, "Total Events",
              :hold_events_per_call, "Events per Call",
              :duration_of_hold_events, "Total Duration",
              :average_duration_of_hold_events, "Average Duration"
            ]
          end
        end
      end
    end
  end
end
