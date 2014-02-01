require 'spec_helper'

describe Queri::Stats::DetailsOfUnansweredCalls do
  let(:report_class) { Queri::Stats::DetailsOfUnansweredCalls }

  it_behaves_like "a report class"
end
