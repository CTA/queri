require 'spec_helper'

describe Queri do
  describe "::config" do
    subject { Queri.config }

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should return a Hash" do
      subject.should be_a Hash
    end
  end

  describe "::configure" do
    let(:configs) { Hash[:password, "new_secret"] }

    before do
      @saved_configs = Queri.config.dup
    end

    subject { Queri.configure(configs) }

    after do
      Queri.configure(@saved_configs)
    end

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should require a Hash" do
      expect{ Queri.configure(configs.to_a) }.to raise_error(ArgumentError)
      expect{ Queri.configure(configs) }.to_not raise_error
    end

    it "should default to accept a Hash" do
      expect{ Queri.configure }.to_not raise_error
    end

    it "should update project configurations" do
      old_configs = Queri.config.dup
      subject
      Queri.config.should_not eq old_configs
    end

    context "given some erroneous keys" do
      let(:configs) { Hash[:password, "new_secret", :foo, "bar"] }

      it "should warn the user against bad data" do
        Queri::XmlClient.should_receive(:puts).with("WARNING:  erroneous keys given to ::config. Acceptible keys include #{Queri::XmlClient.instance_variable_get(:@valid_config_keys)}")
        subject
      end

      it "should update project configurations" do
        old_configs = Queri.config.dup
        subject
        Queri.config.should_not eq old_configs
      end
    end

    context "given all erroneous keys" do
      let(:configs) { Hash[:foo, "bar"] }

      it "should raise ArgumentError" do
        expect{ subject }.to raise_error(ArgumentError)
      end

      it "should not update project configurations" do
        old_configs = Queri.config
        begin
          subject
        rescue ArgumentError
        end
        Queri.config.should eq old_configs
      end
    end
  end

  describe "::configure_with" do
    let(:test_config_file) { File.join(File.dirname(__FILE__), 'test_config.yml') }

    before do
      @saved_configs = Queri.config.dup
      File.open(test_config_file, 'w') do |f|
        f << "---\n"
        f << "  :password:  \"new_secret\""
      end
    end

    subject { Queri.configure_with(test_config_file) }

    after do
      FileUtils.rm(test_config_file)
      Queri.configure(@saved_configs)
    end

    it "should respond" do
      expect{ subject }.to_not raise_error
    end

    it "should require a String" do
      expect{ Queri.configure_with(Array.new) }.to raise_error(ArgumentError)
      expect{ Queri.configure_with(test_config_file) }.to_not raise_error
    end

    it "should update project configurations" do
      old_configs = Queri.config.dup
      subject
      Queri.config.should_not eq old_configs
    end

    context "given a bad file path" do
      let(:bad_config_file) { File.join(File.dirname(__FILE__), 'nonexistant_config.yml') }

      subject { Queri.configure_with(bad_config_file) }

      it "should raise LoadError" do
        expect{ subject }.to raise_error(LoadError)
      end

      it "should not update project configurations" do
        old_configs = Queri.config.dup
        begin
          subject
        rescue LoadError
        end
        Queri.config.should eq old_configs
      end
    end

    context "given file with syntax error" do
      before do
        File.open(test_config_file, 'w') do |f|
          f << "---"
          f << "\t:password: bad_syntax"
        end
      end

      it "should raise LoadError" do
        expect{ subject }.to raise_error(LoadError)
      end

      it "should not update project configurations" do
        old_configs = Queri.config.dup
        begin
          subject
        rescue LoadError
        end
        Queri.config.should eq old_configs
      end
    end
  end
end
