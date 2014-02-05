require 'spec_helper'

describe Queri::Stats::CallOutcomes do
  let(:report_class) { Queri::Stats::CallOutcomes }

  it_behaves_like "a report class"
end
