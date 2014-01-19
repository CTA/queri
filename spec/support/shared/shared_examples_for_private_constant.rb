shared_examples "a private constant" do
  it "should be defined" do
    Queri.const_defined?(const_symbol).should be_true
  end

  it "should not be publically accessible" do
    expect{ constant }.to raise_error NameError
  end
end
