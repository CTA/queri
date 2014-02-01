module Queri
  class Stats
    class UnansweredCalls
      class UnansweredCallsByKeyPress < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".ReportKoKeyPress"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :key_pressed, "Key",
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
