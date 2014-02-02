module Queri
  class Stats
    class CallDistributionByHour
      class SalesPerHour < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByHour.xml_code + ".SalesPerHr"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :hour, "Hour",
              :conv, "Conv.",
              :qconv, "QConv.",
              :sales, "Sales",
              :sales_percentage, "&nbsp;",
              :placeholder_for_sales_bar_graph, "&nbsp;",
              :qcont, "QCont.",
              :contacts, "Contacts",
              :contacts_percentage, "&nbsp;",
              :placeholder_for_contacts_bar_graph, "&nbsp;"
            ]
          end
        end
      end
    end
  end
end
