module Queri
  class Stats
    class AnsweredCalls
      class AnsweredCallsByDirection < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".AnsweredcallsByDirection"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :direction_icon, "&nbsp;",
              :direction, "Direction",
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
