shared_examples "a report method" do
  describe "::query_method" do
    subject { report_class.query_method }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should be a String" do
      subject.should be_a String
    end
  end
end
