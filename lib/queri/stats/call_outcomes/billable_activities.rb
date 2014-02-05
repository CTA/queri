module Queri
  class Stats
    class CallOutcomes
      class BillableActivities < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallOutcomes.xml_code + ".ActivBillable"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :activity, "Activity",
              :number_of_times_performed, "N. Times",
              :total_activity_duration, "Tot. Time",
              :average_activity_duration, "Avg.",
              :minimum_activity_duration, "Min.",
              :maximum_activity_duration, "Max.",
              :percentage_of_all_performed_activities, "%",
              :placeholder_for_bar_graph, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
