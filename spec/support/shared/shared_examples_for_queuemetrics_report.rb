shared_examples "a queuemetrics report" do
  describe "::key_translations" do
    subject { report_class.key_translations }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should be a Hash" do
      subject.should be_a Hash
    end
  end

  describe "::keys" do
    subject { report_class.keys }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should be a Array" do
      subject.should be_a Array
    end
  end
end
