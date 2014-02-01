module AggregateReportHelpers
  private

    def parse_response
      r = Queri.send_request(@queues, self, @period_start, @period_end)
      pairs = self.class.key_translations.each_pair
      r.shift
      new_metrics = r.map do |metric|
        [pairs.next[0], metric[1]]
      end
      Hash[*new_metrics.flatten]
    end
end
