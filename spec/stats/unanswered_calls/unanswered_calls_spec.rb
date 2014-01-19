require File.join( File.dirname(__FILE__), '..', '..', 'spec_helper' )

describe Queri::Stats::UnansweredCalls do
  let(:report_class) { Queri::Stats::UnansweredCalls }

  it_behaves_like "a report class"
end
