require 'spec_helper'

describe Queri::Stats::DetailsOfAgentSessionsAndPauses::DetailOfAgentSessions, :focus do
  let(:report_class) { Queri::Stats::DetailsOfAgentSessionsAndPauses::DetailOfAgentSessions }
  let(:xml_code) { report_class.xml_code }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::DetailsOfAgentSessionsAndPauses::DetailOfAgentSessions do
    it_behaves_like "an agent-level report instance"
  end
end
