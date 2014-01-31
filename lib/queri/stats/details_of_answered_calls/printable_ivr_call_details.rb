module Queri
  class Stats
    class DetailsOfAnsweredCalls
      class PrintableIvrCallDetails < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            DetailsOfAnsweredCalls.xml_code + ".CallsIVR"
          end

          def key_translations
            Hash[
            ]
          end
        end
      end
    end
  end
end
