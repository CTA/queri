require File.join( File.dirname(__FILE__), '..', '..', 'spec_helper' )

describe Queri::Stats::AnsweredCalls::AgentsOnQueue do
  let(:report_class) { Queri::Stats::AnsweredCalls::AgentsOnQueue }
  let(:xml_code) { report_class.xml_code }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::AnsweredCalls::AgentsOnQueue do
    it_behaves_like "an agent-level report instance"
  end
end
