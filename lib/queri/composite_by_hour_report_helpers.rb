module CompositeByHourReportHelpers
  private

    def parse_response
      r = Queri.send_request(@queues, self, @period_start, @period_end)
      k_t = self.class.key_translations
      column_headers = r.shift
      new_headers = []
      column_headers.each_with_index do |h,i|
        if i == 0
          new_headers << k_t.to_a[i][0]
        elsif i == column_headers.length-1
          new_headers << k_t.to_a[-1][0]
        else
          new_headers << (h + ":00 hour time").to_sym
        end
      end
      r.map do |agent|
        Hash[new_headers.zip(agent)]
      end
    end
end
