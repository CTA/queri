module Queri
  class Realtime
    class Calls < Queri::Realtime
      include CompositeReportHelpers

      class << self
        def xml_code
          Realtime.xml_code + ".RTCallsBeingProc"
        end

        def key_translations
          ActiveSupport::OrderedHash[
            :direction_of_call, "&nbsp;",
            :queue, "Queue &nbsp;",
            :clid, "Caller &nbsp;",
            :time_call_entered_queue, "Entered &nbsp;",
            :time_in_ivr, "IVR",
            :time_call_on_wait, "Waiting &nbsp;",
            :call_duration, "Duration &nbsp;",
            :agent, "Agent &nbsp;",
            :music_on_hold, "MOH",
            :server, "Srv",
            :magic_wand, "&nbsp;",
          ]
        end
      end
    end
  end
end
