module Queri
  class Stats
    class UnansweredCalls
      class DnisUsedForAllCalls < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".DnisOkKo"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :dnis, "DNIS",
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
