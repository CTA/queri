require 'spec_helper'

describe Queri::Stats::AgentsAndSessions::AgentBillableTimeByHour do
  let(:report_class) { Queri::Stats::AgentsAndSessions::AgentBillableTimeByHour }
  let(:xml_code) { report_class.xml_code }

  before { Queri.configure_with(File.join(File.dirname(__FILE__), '..', '..', 'config.yml')) }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::AgentsAndSessions::AgentBillableTimeByHour do
    it_behaves_like "an agent-level report instance"
  end
end
