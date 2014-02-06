module Queri
  class Realtime
    class Queues < Queri::Realtime
      include CompositeReportHelpers

      class << self
        def xml_code
          Realtime.xml_code + ".RTRiassunto"
        end

        def key_translations
          Hash[
            :empty_column, "&nbsp;",
            :queue, "Queue &nbsp;",
            :agents_logged_on, "N. agents",
            :ready_agents, "Ready agents",
            :paused_agents, "On pause",
            :nonmembers_on_calls, "Unk",
            :members_on_call_in_another_queue, "Bsy",
            :calls_waiting, "N. Calls waiting",
            :agents_handling_inbound_calls, "On phone inbound",
            :agents_handling_outbound_calls, "On phone outbound"
          ]
        end
      end
    end
  end
end
