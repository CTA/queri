require 'spec_helper'

describe Queri::Stats::CallDistributionByDayOfWeek do
  let(:report_class) { Queri::Stats::CallDistributionByDayOfWeek }

  it_behaves_like "a report class"
end
