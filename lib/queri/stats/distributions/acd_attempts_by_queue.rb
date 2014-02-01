module Queri
  class Stats
    class Distributions
      class AcdAttemptsByQueue < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            Distributions.xml_code + ".AcdByQueue"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :queue, "Queue",
              :number_of_lost_agent_attempts, "N. lost",
              :average_ring_time_for_lost_attempts, "Avg ring",
              :total_ring_time_for_lost_attempts, "Ring (s)",
              :number_of_taken_agent_attempts, "N. Taken",
              :average_ring_time_for_taken_attempts, "Avg ring",
              :total_ring_time_for_taken_attempts, "Ring (s)"
            ]
          end
        end
      end
    end
  end
end
