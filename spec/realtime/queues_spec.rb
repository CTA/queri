require File.join( File.dirname(__FILE__), '..', 'spec_helper' )

describe Queri::Realtime::Queues do
  let(:report_class) { Queri::Realtime::Queues }
  let(:xml_code) { report_class.xml_code }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a realtime report"

  describe "An instance of", Queri::Realtime::Queues do
    it_behaves_like "a realtime report instance"
  end
end
