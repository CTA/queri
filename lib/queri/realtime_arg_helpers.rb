module RealtimeArgHelpers

  private

      def valid_args? args
        valid = true
        valid = false if args[0].class != Array
        if valid and args[0].empty?
          raise ArgumentError, "queues array cannot be empty"
        end
        return valid
      end
end
