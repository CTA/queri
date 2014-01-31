module ArgHelpers

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
end
