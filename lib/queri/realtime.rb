module Queri
  class Realtime
    include RealtimeArgHelpers

    attr_reader :response

    @@query_method = "QM.realtime"
    @@xml_code = "RealtimeDO"

    class << self
      def query_method
        @@query_method
      end

      def xml_code
        @@xml_code
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

  end
end
