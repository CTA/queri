module Queri
  class Stats
    class DetailsOfAnsweredCalls
      class PrintableIvrCallDetails

        class << self
          def xml_code
            DetailsOfAnsweredCalls.xml_code + ".CallsIVR"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
            ]
          end

          def keys
            key_translations.keys
          end
        end

def initialize *args
p parse(args)
end

private

def parse args
Queri.send_request(args[0], self, args[1], args[2])
end

      end
    end
  end
end
