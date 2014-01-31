module AggregateReportHelpers
  private

    def parse_response
      r = Queri.send_request(@queues, self, @period_start, @period_end)
      xml_keys_to_human_readable_keys = self.class.key_translations.invert
      r.each_with_index do |metric,i|
        if i > 0
          metric[0] = xml_keys_to_human_readable_keys[ metric[0] ]
        end
      end
      r.shift
      Hash[*r.flatten]
    end
end
