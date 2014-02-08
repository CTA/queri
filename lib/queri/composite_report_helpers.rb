module CompositeReportHelpers
  private

    def parse_response
      r = Queri::XmlClient.send_request(@queues, self, @period_start, @period_end)
      new_keys = self.class.keys
      r.shift
      r.map do |agent|
        Hash[new_keys.zip(agent)]
      end
    end
end
