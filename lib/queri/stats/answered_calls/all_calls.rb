module Queri
  class Stats
    class AnsweredCalls
      class AllCalls
        attr_reader :response

        class << self
          def xml_code
            AnsweredCalls.xml_code + ".RiassAllCalls"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
              :calls_answered, "N. calls answered by operators:",
              :average_call_length, "Average call length:",
              :minimum_call_length, "Min call length:",
              :maximum_call_length, "Max call length:",
              :total_call_length, "Total call length:",
              :average_wait_time, "Average call waiting time:",
              :minimum_wait_time, "Min waiting time:",
              :maximum_wait_time, "Max waiting time:",
              :total_wait_time, "Total waiting time:",
              :average_initial_queue_position, "Average initial position",
              :minimum_initial_queue_position, "Min initial position",
              :maximum_initial_queue_position, "Max initial position",
              :queue_position_coverage, "Coverage"
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
