module Queri
  class Stats
    include ArgHelpers

    attr_reader :response

    @@query_method = "QM.stats"

    class << self
      def query_method
        @@query_method
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

  end
end
