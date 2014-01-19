module Queri
  class Realtime
    class Queues
      attr_reader :response

      class << self
        def xml_code
          Realtime.xml_code + ".RTRiassunto"
        end

        def query_method
          Realtime.query_method
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

        def keys
          key_translations.keys
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
          xml_keys_to_human_readable_keys = self.class.key_translations.invert
          new_keys = r.shift.map {|k| xml_keys_to_human_readable_keys[k]}
          agent_metrics = []
          r.each do |agent|
            agent_metrics << Hash[new_keys.zip(agent)]
          end
          return agent_metrics
        end
    end
  end
end
