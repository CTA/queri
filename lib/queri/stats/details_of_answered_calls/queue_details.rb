module Queri
  class Stats
    class DetailsOfAnsweredCalls
      class QueueDetails
        attr_reader :response

        class << self
          def xml_code
            DetailsOfAnsweredCalls.xml_code + ".CallsOK"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
              :date, "Date",
              :caller_id, "Caller",
              :queue, "Queue",
              :wait_time, "Wait",
              :call_duration, "Duration",
              :initial_queue_position, "Pos.",
              :disconnection_cause, "Disconnection",
              :handling_agent, "Handled by",
              :number_of_agents_attempted_before_connect, "Attempts",
              :completion_code, "Code",
              :stints, "Stints",
              :server, "Srv",
              :placeholder_for_hourglass, "&nbsp;",
              :empty, "&nbsp;",
              :placeholder_for_linked_url, "&nbsp;"
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
