module Queri
  class Stats
    class DetailsOfAgentSessionsAndPauses
      class DetailOfAgentSessions
        attr_reader :response

        class << self
          def xml_code
            DetailsOfAgentSessionsAndPauses.xml_code + ".AgentSessions"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
              :agent, "Agent",
              :clock_in, "Start hour", 
              :clock_out, "End hour", 
              :session_duration, "Duration", 
              :call_back_extension, "Ext.", 
              :termination, "Termination", 
              :number_of_pauses, "Pause", 
              :total_pause_time, "P.Time", 
              :server, "Srv"
            ]
          end

          def keys
            key_translations.keys
          end
        end

        def initialize *args
          raise ArgumentError, "expected arguments: queues(Array), period_start(Time), period_end(Time)" unless valid_args?(args)
          @queues, @period_start, @period_end = normalize_times(*args)
          @response = parse_response
        end

        private

          def valid_args? args
            valid = true
              valid = false if args[0].class != Array
              valid = false if args[1].class != Time
              valid = false if args[2].class != Time
              if valid and args[0].empty?
                raise ArgumentError, "queues array cannot be empty"
              end
            return valid
          end

          def normalize_times queues, period_start, period_end
            if period_start > period_end
              tmp = period_start
              period_start = period_end
              period_end = tmp
            end
            return [queues, period_start, period_end]
          end

          def parse_response
            r = Queri.send_request(@queues, self, @period_start, @period_end)
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
end
