require 'spec_helper'

describe Queri::Stats::AgentsAndSessions do
  let(:report_class) { Queri::Stats::AgentsAndSessions }

  it_behaves_like "a report class"
end
