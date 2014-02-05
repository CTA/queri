module Queri
  class Stats
    class IvrTracking
      class IvrTraversals < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            IvrTracking.xml_code + ".IvrReport"
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

def initialize *args
p parse args
end

def parse args
Queri.send_request(args[0], self, args[1], args[2])
end

      end
    end
  end
end
