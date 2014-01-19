shared_examples "a report class" do
  describe "::xml_code" do
    subject { report_class.xml_code }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should be a String" do
      subject.should be_a String
    end
  end
end
