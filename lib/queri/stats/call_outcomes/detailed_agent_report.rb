module Queri
  class Stats
    class CallOutcomes
      class DetailedAgentReport < Queri::Stats
        include CompositeReportHelpers

        class << self
          def xml_code
            CallOutcomes.xml_code + ".AgentReportDetailed"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :agent, "Agent name",
              :available_time, "Avail.",
              :percentage_of_login_time_as_available, "&nbsp;",
              :billable_time, "Bill.",
              :percentage_of_login_time_as_billable, "&nbsp;",
              :nonbillable_time, "NonB.",
              :percentage_of_login_time_as_nonbillable, "&nbsp;",
              :number_of_sales, "Sales",
              :number_of_qualified_contacts, "QC.",
              :number_of_contacts, "Cont.",
              :sales_per_hour, "SPH",
              :qualified_contacts_per_hour, "QCPH",
              :contacts_per_hour, "CPH",
              :percentage_of_sales_to_sales_plus_contacts, "CONV",
              :percentage_of_sales_to_sales_plus_qualified_contacts, "QCONV"
            ]
          end
        end
      end
    end
  end
end
