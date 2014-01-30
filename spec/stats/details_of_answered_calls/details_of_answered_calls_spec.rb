require File.join( File.dirname(__FILE__), '..', '..', 'spec_helper' )

describe Queri::Stats::DetailsOfAnsweredCalls do
  let(:report_class) { Queri::Stats::DetailsOfAnsweredCalls }

  it_behaves_like "a report class"
end
