module Queri
  module XmlClient
    class Request
      attr_reader :report

      def initialize args
        raise ArgumentError, "expected arguments: queues(Array), report(Stats or Realtime obj), period_start(Time or Nil), period_end(Time or Nil)" unless valid_args?(args)
        @queues, @report, @period_start, @period_end = validate_args(args)
      end

      def parameters
        if @period_start.nil? && @period_end.nil?
          [@report.class.query_method, @queues.join("|"), Queri::XmlClient.config[:username], Queri::XmlClient.config[:password], LOGFILE, AGENT_FILTER, [@report.class.xml_code]]
        else
          [@report.class.query_method, @queues.join("|"), Queri::XmlClient.config[:username], Queri::XmlClient.config[:password], LOGFILE, PERIOD, @period_start, @period_end, AGENT_FILTER, [@report.class.xml_code]]
        end
      end

      private

        def valid_args? args
          valid = true
          valid = false if args[0].class != Array
          valid = false if args[1].class == NilClass
          valid = false if (args[2].class != NilClass && args[2].class != Time)
          valid = false if (args[3].class != NilClass && args[3].class != Time)
          return valid
        end

        def validate_args args
          raise ArgumentError, "queues array cannot be empty" if args[0].empty?
          if args[1].class.name.include?("Queri::Stats::")
            if (args[2].nil? || args[3].nil?)
              raise ArgumentError, "Queri::Stats reports require non-nil period start and end times"
            end
          elsif args[1].class.name.include?("Queri::Realtime::")
            unless (args[2].nil? && args[3].nil?)
              raise ArgumentError, "Queri::Realtime reports require nil period start and end times"
            end
          end
          args[2] = format_time(args[2])
          args[3] = format_time(args[3])
          return args
        end

        def format_time time
          return time unless time.respond_to?(:strftime)
          time.strftime("%Y-%m-%d.%H:%M:%S")
        end
    end
  end
end
