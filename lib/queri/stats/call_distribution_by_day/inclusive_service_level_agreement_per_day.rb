module Queri
  class Stats
    class CallDistributionByDay
      class InclusiveServiceLevelAgreementPerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".InclSlaPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
              :number_of_answered_calls, "Ans.",
              :number_of_unanswered_calls, "Unans.",
              :number_of_processed_calls, "Num",
              :percentage_of_calls_answered_under_10_sec, "&lt; 10",
              :percentage_of_calls_answered_under_20_sec, "&lt; 20",
              :percentage_of_calls_answered_under_30_sec, "&lt; 30",
              :percentage_of_calls_answered_under_40_sec, "&lt; 40",
              :percentage_of_calls_answered_under_50_sec, "&lt; 50",
              :percentage_of_calls_answered_under_60_sec, "&lt; 60",
              :percentage_of_calls_answered_under_70_sec, "&lt; 70",
              :percentage_of_calls_answered_under_80_sec, "&lt; 80",
              :percentage_of_calls_answered_under_90_sec, "&lt; 90",
              :percentage_of_calls_answered_under_100_sec, "&lt; 100",
              :percentage_of_calls_answered_under_110_sec, "&lt; 110",
              :percentage_of_calls_answered_under_120_sec, "&lt; 120"
            ]
          end
        end
      end
    end
  end
end
