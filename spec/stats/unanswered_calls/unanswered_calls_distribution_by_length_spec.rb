require 'spec_helper'

describe Queri::Stats::UnansweredCalls::UnansweredCallsDistributionByLength do
  let(:report_class) { Queri::Stats::UnansweredCalls::UnansweredCallsDistributionByLength }
  let(:xml_code) { report_class.xml_code }

  before { Queri.configure_with(File.join(File.dirname(__FILE__), '..', '..', 'config.yml')) }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::UnansweredCalls::UnansweredCallsDistributionByLength do
    it_behaves_like "a composite aggregate report instance"
  end
end
