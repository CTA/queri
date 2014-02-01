module Queri
  class Stats
    class UnansweredCalls
      class AllCalls < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".ReportKoAll"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :calls_unanswered, "N.of unanswered calls:",
              :average_wait_before_disconnect, "Average wait time before disconnection:",
              :minimum_wait_before_disconnect, "Min wait time before disconnection:",
              :maximum_wait_before_disconnect, "Max wait time before disconnection:",
              :total_wait_before_disconnect, "Total wait time before disconnection:",
              :average_initial_queue_position, "Average initial position",
              :minimum_initial_queue_position, "Min initial position",
              :maximum_initial_queue_position, "Max initial position",
              :queue_position_coverage, "Coverage",
              :average_queue_position_at_disconnect, "Average queue position at disconnection:",
              :minimum_queue_position_at_disconnect, "Min queue position at disconnection:",
              :maximum_queue_position_at_disconnect, "Max queue position at disconnection:"
            ]
          end
        end
      end
    end
  end
end
