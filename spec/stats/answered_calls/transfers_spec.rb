require 'spec_helper'

describe Queri::Stats::AnsweredCalls::Transfers do
  let(:report_class) { Queri::Stats::AnsweredCalls::Transfers }
  let(:xml_code) { report_class.xml_code }

  before do
    Queri.configure_with(File.join(File.dirname(__FILE__), '..', '..', 'config.yml'))
    Queri.stub(:send_request).and_return(
      [["Transfer to", "N. Calls", "&nbsp;", "..."],
        ["211", "121", "10.0%", ""],
        ["311", "122", "10.0%", ""]]
    )
  end

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a stats report"

  describe "An instance of", Queri::Stats::AnsweredCalls::Transfers do
    it_behaves_like "a composite aggregate report instance"
  end
end
