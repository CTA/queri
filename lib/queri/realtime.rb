module Queri
  class Realtime
    @@query_method = "QM.realtime"
    @@xml_code = "RealtimeDO"

    def self.query_method
      @@query_method
    end

    def self.xml_code
      @@xml_code
    end
  end
end
