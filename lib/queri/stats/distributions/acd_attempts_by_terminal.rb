module Queri
  class Stats
    class Distributions
      class AcdAttemptsByTerminal < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            Distributions.xml_code + ".AcdByTerminals"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent",
              :number_of_lost_attempts, "N. lost",
              :average_ring_time_for_lost_attempts, "Avg ring",
              :total_ring_time_for_lost_attempts, "Ring (s)",
              :number_of_taken_attempts, "N. Taken",
              :average_ring_time_for_taken_attempts, "Avg ring",
              :total_ring_time_for_taken_attempts, "Ring (s)"
            ]
          end
        end
      end
    end
  end
end
