module Queri
  class Stats
    class Distributions
      class InboundAcdCallAttempts < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            Distributions.xml_code + ".ReportAcd"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :total_attempts_sent_to_operators, "Total ACD attempts sent to operators:",
              :placeholder_for_taken_calls, "Taken calls",
              :average_attempts_for_taken_calls, "Average attempts:",
              :minimum_attempts_for_taken_calls, "Min attempts:",
              :maximum_attempts_for_taken_calls, "Max attempts:",
              :total_attempts_for_taken_calls, "Total attempts:",
              :placeholder_for_lost_calls, "Lost calls",
              :average_attempts_for_lost_calls, "Average attempts:",
              :minimum_attempts_for_lost_calls, "Min attempts:",
              :maximum_attempts_for_lost_calls, "Max attempts:",
              :total_attempts_for_lost_calls, "Total attempts:"
            ]
          end
        end
      end
    end
  end
end
