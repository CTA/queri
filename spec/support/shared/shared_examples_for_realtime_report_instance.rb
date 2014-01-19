shared_examples "a realtime report instance" do
  let(:queues) { ["10000"] }

  before do
    @client = double(XMLRPC::Client)
    @client.stub(:call).and_return( {xml_code => [report_class.keys]} )
  end

  subject { report_class.new(queues) }

  it { should_not respond_to :response= }

  describe "#response" do
    subject { report_class.new(queues).response }

    it "should respond" do
      XMLRPC::Client.stub(:new).and_return(@client)
      expect{ subject }.to_not raise_error
    end

    it "should be an Array" do
      XMLRPC::Client.stub(:new).and_return(@client)
      subject.should be_a Array
    end
  end
end
