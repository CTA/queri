module Queri
  class Stats
    class AnsweredCalls
      class AllCalls < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".RiassAllCalls"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :calls_answered, "N. calls answered by operators:",
              :average_call_length, "Average call length:",
              :minimum_call_length, "Min call length:",
              :maximum_call_length, "Max call length:",
              :total_call_length, "Total call length:",
              :average_wait_time, "Average call waiting time:",
              :minimum_wait_time, "Min waiting time:",
              :maximum_wait_time, "Max waiting time:",
              :total_wait_time, "Total waiting time:",
              :average_initial_queue_position, "Average initial position",
              :minimum_initial_queue_position, "Min initial position",
              :maximum_initial_queue_position, "Max initial position",
              :queue_position_coverage, "Coverage"
            ]
          end
        end
      end
    end
  end
end
