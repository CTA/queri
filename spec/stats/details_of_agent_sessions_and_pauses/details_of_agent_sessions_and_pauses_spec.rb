require 'spec_helper'

describe Queri::Stats::DetailsOfAgentSessionsAndPauses do
  let(:report_class) { Queri::Stats::DetailsOfAgentSessionsAndPauses }

  it_behaves_like "a report class"
end
