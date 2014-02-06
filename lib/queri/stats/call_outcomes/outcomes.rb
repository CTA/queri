module Queri
  class Stats
    class CallOutcomes
      class Outcomes < Queri::Stats
        include AggregateReportHelpers

        class << self
          def xml_code
            CallOutcomes.xml_code + ".GeneralRep"
          end

          def key_translations
            ActiveSupport::OrderedHash[
              :total_billable_time, "Total billable time:",
              :total_agent_available_time, "Total agent available time:",
              :total_agent_billable_activities, "Total agent billable activities:",
              :total_nonbillable_time, "Total nonbillable time:",
              :number_of_sales, "Number of Sales:",
              :number_of_qualified_contacts, "Number of Qualified Contacts:",
              :number_of_contacts, "Number of Contacts:",
              :sales_per_hour, "Sales per Hour (SPH):",
              :qualified_contacts_per_hour, "Qualified Contacts per Hour (QCPH):",
              :contacts_per_hour, "Contacts per Hour (CPH):",
              :percentage_of_sales_to_sales_plus_contacts, "Conversion index:",
              :percentage_of_sales_to_sales_plus_qualified_contacts, "Qualified conversion index:"
            ]
          end
        end
      end
    end
  end
end
