module Queri
  class Stats
    class UnansweredCalls
      class IvrSelectionForAllCalls < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".IvrOkKo"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :ivr_selection, "IVR",
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
