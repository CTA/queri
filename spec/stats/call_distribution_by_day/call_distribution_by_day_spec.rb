require 'spec_helper'

describe Queri::Stats::CallDistributionByDay do
  let(:report_class) { Queri::Stats::CallDistributionByDay }

  it_behaves_like "a report class"
end
