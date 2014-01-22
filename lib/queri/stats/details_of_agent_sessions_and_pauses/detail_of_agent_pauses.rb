module Queri
  class Stats
    class DetailsOfAgentSessionsAndPauses
      class DetailOfAgentPauses
        attr_reader :response

        class << self
          def xml_code
            DetailsOfAgentSessionsAndPauses.xml_code + ".AgentPauses"
          end

          def query_method
            Stats.query_method
          end

          def key_translations
            Hash[
              :agent, "Agent",
              :extension, "Ext.",
              :pause_code, "Code",
              :pause_activity, "Activity",
              :pause_billable_code, "&nbsp;",
              :pause_billable, "Billable?",
              :pause_start, "Start hour",
              :pause_end, "End hour",
              :pause_duration, "Duration"
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
            agents = agent_metrics.map {|a| a[:agent]}.uniq
            parsed_metrics = Hash.new
            agents.each do |agent|
              parsed_metrics[agent] = agent_metrics.select {|m| m[:agent] == agent}
            end
            return parsed_metrics
          end
      end
    end
  end
end
