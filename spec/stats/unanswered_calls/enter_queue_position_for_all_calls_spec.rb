require 'spec_helper'

describe Queri::Stats::UnansweredCalls::EnterQueuePositionForAllCalls do
  let(:report_class) { Queri::Stats::UnansweredCalls::EnterQueuePositionForAllCalls }
  let(:xml_code) { report_class.xml_code }

  before do
    Queri.configure_with(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
  end

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::UnansweredCalls::EnterQueuePositionForAllCalls do
    it_behaves_like "a composite aggregate report instance"
  end
end
