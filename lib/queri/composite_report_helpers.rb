module CompositeReportHelpers
  private

    def parse_response
      r = Queri.send_request(@queues, self, @period_start, @period_end)
      xml_keys_to_human_readable_keys = self.class.key_translations.invert
      new_keys = r.shift.map {|k| xml_keys_to_human_readable_keys[k]}
      agent_metrics = []
      r.each do |agent|
        agent_metrics << Hash[new_keys.zip(agent)]
      end
      return agent_metrics
    end
end
