module Queri
  class Stats
    class AreaCodeAnalysis
      class DetailForAnsweredCalls < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            AreaCodeAnalysis.xml_code + ".CallsOK"
          end

          def key_translations
            Hash[
              :area_code_or_caller_id, "Area code/Caller id",
              :taken_calls, "Taken calls &nbsp;",
              :total_calling_time, "Total calling time &nbsp;",
              :average_call_time, "Average time per call",
              :average_waiting_time, "Average wait time per call"
            ]
          end
        end
      end
    end
  end
end
