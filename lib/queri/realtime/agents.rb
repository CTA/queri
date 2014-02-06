module Queri
  class Realtime
    class Agents < Queri::Realtime
      include CompositeReportHelpers

      class << self
        def xml_code
          Realtime.xml_code + ".RTAgentsLoggedIn"
        end

        def key_translations
          ActiveSupport::OrderedHash[
            :ready_state, "&nbsp;",
            :empty_column, "&nbsp;",
            :agent, "Agent &nbsp;",
            :login_time, "Last logon &nbsp;",
            :assigned_queues, "Queue(s):",
            :extension, "Extension &nbsp;",
            :pause, "On pause &nbsp;",
            :server, "Srv",
            :time_last_call_ended, "Last call",
            :on_queue, "On queue",
            :magic_wand, "&nbsp;"
          ]
        end
      end
    end
  end
end
