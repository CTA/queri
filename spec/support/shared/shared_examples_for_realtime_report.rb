shared_examples "a realtime report" do
  describe "::new" do
    let(:queues) { ["10000"] }

    before do
      @client = double(XMLRPC::Client)
      @client.stub(:call).and_return( {xml_code => [report_class.keys]} )
    end

    subject { report_class.new(queues) }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    context "missing arguments" do
      subject { report_class.new }

      it "should raise ArgumentError" do
        expect{ subject }.to raise_error(ArgumentError, "expected argument: queues(Array)")
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
