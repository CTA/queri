module Queri
  class Stats
    class CallDistributionByDayOfWeek
      class TrafficAnalysisByPeriodPerDayOfWeek < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDayOfWeek.xml_code + ".TrafficAnPerDOW"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day_of_week, "DayOfWeek",
              :average_agents_logged_in_per_period_vs_total_period, "Avg ag",
              :number_of_incoming_calls_per_period_vs_available_agents, "Calls/Ag",
              :incoming_calls_sla, "Svc Lvl",
              :number_of_lost_calls, "Unans",
              :percentage_of_lost_calls_below_x_seconds, "Unans short",
              :number_of_outgoing_calls_per_period_vs_available_agents, "Avg out",
              :outbound_to_inbound_ratio, "Out/in",
              :average_incoming_call_wait_time, "Avg ans",
              :average_incoming_call_talk_time, "Avg talk",
              :maximum_answered_incoming_call_wait_time, "Max wait ans",
              :maximum_lost_incoming_call_wait_time, "Max wait lost",
              :maximum_incoming_call_talk_time, "Max dur",
              :maximum_outgoing_call_talk_time, "Max dur out",
              :number_of_incoming_calls, "Off.",
              :number_of_answered_incoming_calls, "Ans.",
              :number_of_answered_outgoing_calls, "Ans. out",
              :minimum_logged_on_agents_for_period, "Min Ag.",
              :maximum_logged_on_agents_for_period, "Max Ag."
            ]
          end
        end
      end
    end
  end
end
