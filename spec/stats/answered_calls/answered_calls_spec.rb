require 'spec_helper'

describe Queri::Stats::AnsweredCalls do
  let(:report_class) { Queri::Stats::AnsweredCalls }

  it_behaves_like "a report class"
end
