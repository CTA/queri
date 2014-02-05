require 'spec_helper'

describe Queri::Stats::IvrTracking, :focus do
  let(:report_class) { Queri::Stats::IvrTracking }

  it_behaves_like "a report class"
end
