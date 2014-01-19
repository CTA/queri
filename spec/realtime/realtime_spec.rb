require File.join( File.dirname(__FILE__), '..', 'spec_helper' )

describe Queri::Realtime do
  let(:report_method) { Queri::Realtime }
  let(:report_class) { Queri::Realtime }

  it_behaves_like "a report method"

  it_behaves_like "a report class"
end
