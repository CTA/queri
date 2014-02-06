module Queri
  class Stats
    class CallOutcomes
      class CallResultsByOutcomes < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallOutcomes.xml_code + ".CallResByOutcome"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :call_outcome, "Call outcome",
              :outcome_type, "Type",
              :number_of_calls_for_outcome, "Total",
              :number_of_answered_calls_for_outcome, "Taken",
              :number_of_unanswered_calls_for_outcome, "Lost",
              :percentage_of_calls_for_outcome, "%",
              :placeholder_for_bar_graph, "&nbsp;",
              :hourglass, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
