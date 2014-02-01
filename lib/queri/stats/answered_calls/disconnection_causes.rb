module Queri
  class Stats
    class AnsweredCalls
      class DisconnectionCauses < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".DisconnectionCauses"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :disconnection_cause, "Cause",
              :number_of_calls, "N. Calls",
              :percentage_of_calls, "&nbsp;",
              :placeholder_for_bar_graph, "..."
            ]
          end
        end
      end
    end
  end
end
