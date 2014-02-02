require 'spec_helper'

describe Queri::Stats::CallDistributionByHour do
  let(:report_class) { Queri::Stats::CallDistributionByHour }

  it_behaves_like "a report class"
end
