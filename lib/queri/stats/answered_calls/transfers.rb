module Queri
  class Stats
    class AnsweredCalls
      class Transfers < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".Transfers"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :extension_transffered_to, "Transfer to",
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
