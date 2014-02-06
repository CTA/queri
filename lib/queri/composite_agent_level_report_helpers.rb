module CompositeAgentLevelReportHelpers
  private

    def parse_response
      r = Queri.send_request(@queues, self, @period_start, @period_end)
      new_keys = self.class.keys
      r.shift
      new_metrics = Hash.new {|h,k| h[k] = []}
      r.each do |agent|
        m = Hash[new_keys.zip(agent)]
        new_metrics[ m[:agent] ] << m
      end
      new_metrics
    end
end
