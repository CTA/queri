shared_examples "an aggregate report instance" do
  let(:queues) { ["10000"] }
  let(:period_start) { Time.now - 7200 }
  let(:period_end) { Time.now - 3600 }

  before do
    @client = double(XMLRPC::Client)
    @client.stub(:call).and_return( {xml_code => []} )
  end

  subject { report_class.new(queues, period_start, period_end) }

  it { should_not respond_to :response= }

  describe "#response" do
    subject { report_class.new(queues, period_start, period_end).response }

    it "should respond" do
      XMLRPC::Client.stub(:new).and_return(@client)
      expect{ subject }.to_not raise_error
    end

    it "should be a Hash" do
      XMLRPC::Client.stub(:new).and_return(@client)
      subject.should be_a Hash
    end

    context "for a period during which records are saved" do
      let(:period_start) { most_recent_11_am_hour }
      let(:period_end) { most_recent_12_pm_hour }

      it "should not be an empty Hash" do
        subject.should_not be_empty
      end
    end
  end
end
