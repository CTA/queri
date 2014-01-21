require File.join( File.dirname(__FILE__), '..', 'spec_helper' )

describe Queri::Realtime::Agents do
  let(:report_class) { Queri::Realtime::Agents }
  let(:xml_code) { report_class.xml_code }

  before { Queri.configure_with(File.join(File.dirname(__FILE__), '..', 'config.yml')) }

  it_behaves_like "a report class"

  it_behaves_like "a report method"

  it_behaves_like "a queuemetrics report"

  it_behaves_like "a realtime report"

  describe "An instance of", Queri::Realtime::Agents do
    it_behaves_like "a realtime report instance"
  end
end
