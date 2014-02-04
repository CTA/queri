module Queri
  class Stats
    class CallDistributionByDayOfWeek
      class SalesPerDayOfWeek < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallDistributionByDayOfWeek.xml_code + ".SalesPerDOW"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :day_of_week, "DayOfWeek",
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
