module Queri
  class Stats
    class AnsweredCalls
      class DnisUsed < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".DnisOk"
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
