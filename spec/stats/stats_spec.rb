require File.join( File.dirname(__FILE__), '..', 'spec_helper' )

describe Queri::Stats do
  let(:report_class) { Queri::Stats }

  it_behaves_like "a report method"
end
