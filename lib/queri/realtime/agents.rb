module Queri
  class Realtime
    class Agents
      attr_reader :response

      class << self
        def xml_code
          Realtime.xml_code + ".RTAgentsLoggedIn"
        end

        def query_method
          Realtime.query_method
        end

        def key_translations
          Hash[
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

        def keys
          # This response is a conversion of a table view, and contains non-unique
          # key values, so this method must be statically recorded, as to maintain
          # order of keys.
          [
            :ready_state,
            :empty_column,
            :agent,
            :login_time,
            :assigned_queues,
            :extension,
            :pause,
            :server,
            :time_last_call_ended,
            :on_queue,
            :magic_wand
          ]
        end
      end

      def initialize *args
        raise ArgumentError, "expected argument: queues(Array)" unless valid_args?(args)
        @queues = args.first
        @response = parse_response
      end

      private

        def valid_args? args
          valid = true
          valid = false if args[0].class != Array
          if valid and args[0].empty?
            raise ArgumentError, "queues array cannot be empty"
          end
          return valid
        end

        def parse_response
          r = Queri.send_request(@queues, self)
          agent_metrics = []
          r.each_with_index do |agent,i|
            if i > 0
              agent_metrics << Hash[self.class.keys.zip(agent)]
            end
          end
          return agent_metrics
        end
    end
  end
end
