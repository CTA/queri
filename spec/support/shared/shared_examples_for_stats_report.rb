shared_examples "a stats report" do
  describe "::new" do
    let(:queues) { ["10000"] }
    let(:period_start) { Time.now - 7200 }
    let(:period_end) { Time.now - 3600 }

    before do
      @client = double(XMLRPC::Client)
      @client.stub(:call).and_return( {xml_code => [report_class.keys]} )
    end

    subject { report_class.new(queues, period_start, period_end) }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    context "missing arguments" do
      subject { report_class.new }

      it "should raise ArgumentError" do
        expect{ subject }.to raise_error(ArgumentError, "expected arguments: queues(Array), period_start(Time), period_end(Time)")
      end
    end

    context "given a period_start greater than period_end" do
      let(:period_start) { period_end + 1 }

      before { XMLRPC::Client.stub(:new).and_return(@client) }

      it "should reassign the values to make sense" do
        subject.instance_variable_get(:@period_start).should < subject.instance_variable_get(:@period_end)
      end
    end

    context "given an empty array for queues" do
      let(:queues) { [] }

      it "should raise ArgumentError" do
        expect{ subject }.to raise_error(ArgumentError, "queues array cannot be empty")
      end
    end
  end
end
