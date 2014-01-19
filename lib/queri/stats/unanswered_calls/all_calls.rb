module Queri
  class Stats
    class UnansweredCalls
      class AllCalls
        attr_reader :response

        class << self
          def xml_code
            UnansweredCalls.xml_code + ".ReportKoAll"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
              :calls_unanswered, "N.of unanswered calls:",
              :average_wait_before_disconnect, "Average wait time before disconnection:",
              :minimum_wait_before_disconnect, "Min wait time before disconnection:",
              :maximum_wait_before_disconnect, "Max wait time before disconnection:",
              :total_wait_before_disconnect, "Total wait time before disconnection:",
              :average_initial_queue_position, "Average initial position",
              :minimum_initial_queue_position, "Min initial position",
              :maximum_initial_queue_position, "Max initial position",
              :queue_position_coverage, "Coverage",
              :average_queue_position_at_disconnect, "Average queue position at disconnection:",
              :minimum_queue_position_at_disconnect, "Min queue position at disconnection:",
              :maximum_queue_position_at_disconnect, "Max queue position at disconnection:"
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
            r.each_with_index do |metric,i|
              if i > 0
                metric[0] = xml_keys_to_human_readable_keys[ metric[0] ]
              end
            end
            r.shift
            Hash[*r.flatten]
          end
      end
    end
  end
end
