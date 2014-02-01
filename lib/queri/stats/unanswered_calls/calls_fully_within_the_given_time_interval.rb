module Queri
  class Stats
    class UnansweredCalls
      class CallsFullyWithinTheGivenTimeInterval < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".ReportKoFully"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :calls_fully_within_the_given_time_interval, "Calls fully within the given time interval:",
              :calls_unanswered, "N.of unanswered calls:",
              :average_call_waiting_time, "Average wait time before disconnection:",
              :minimum_call_waiting_time, "Min wait time before disconnection:",
              :maximum_call_waiting_time, "Max wait time before disconnection:",
              :total_call_waiting_time, "Total wait time before disconnection:",
              :average_initial_queue_position, "Average initial position",
              :minimum_initial_queue_position, "Min initial position",
              :maximum_initial_queue_position, "Max initial position",
              :queue_position_coverage, "Coverage",
              :average_final_queue_position, "Average queue position at disconnection:",
              :minimum_final_queue_position, "Min queue position at disconnection:",
              :maximum_final_queue_position, "Max queue position at disconnection:"
            ]
          end
        end
      end
    end
  end
end
