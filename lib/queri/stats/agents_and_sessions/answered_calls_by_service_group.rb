module Queri
  class Stats
    class AgentsAndSessions
      class AnsweredCallsByServiceGroup < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AgentsAndSessions.xml_code + ".AnsCallsSG"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :level, "Level",
              :number_of_calls_for_service_group, "N. calls",
              :total_talk_time_for_service_group, "Total call time",
              :average_talk_time_for_service_group, "Avg call time",
              :percentage_of_taken_calls_to_queue_calls_for_service_group, "% of queue"
            ]
          end
        end
      end
    end
  end
end
