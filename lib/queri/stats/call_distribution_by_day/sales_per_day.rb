module Queri
  class Stats
    class CallDistributionByDay
      class SalesPerDay < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDay.xml_code + ".SalesPerDay"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day, "Day",
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
