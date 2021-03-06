module Queri
  class Stats
    class AnsweredCalls
      class AnsweredCallsByQueue < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".AnsweredcallsByQueue"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :empty_column, "&nbsp;",
              :queue, "Queue",
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
