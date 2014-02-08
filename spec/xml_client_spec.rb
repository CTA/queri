require 'spec_helper'

describe Queri::XmlClient do
  let(:module_name) { Queri::XmlClient }
  let(:queues) { ["10000"] }
  let(:report) { double(Queri::Realtime::Queues) }

  describe "constants" do
    describe "for log file" do
      let(:const_symbol) { :LOGFILE }
      let(:constant) { Queri::XmlClient::LOGFILE }

      it_behaves_like "a private constant"
    end

    describe "for period" do
      let(:const_symbol) { :PERIOD }
      let(:constant) { Queri::XmlClient::PERIOD }

      it_behaves_like "a private constant"
    end

    describe "for agent filter" do
      let(:const_symbol) { :AGENT_FILTER }
      let(:constant) { Queri::XmlClient::AGENT_FILTER }

      it_behaves_like "a private constant"
    end
  end

  describe "::send_request" do
    before do
      @client = double(XMLRPC::Client)
      @client.stub(:call).and_return( {"xml_code" => [:keys, :for, :report]} )
    end

    subject { Queri::XmlClient.send_request(queues, report) }

    context "without configurations" do
      before do
        @saved_configs = Queri::XmlClient.config.dup
        Queri::XmlClient.class_variable_set(:@@server, nil)
      end

      after do
        Queri::XmlClient.configure(@saved_configs)
      end

      it "should raise LoadError" do
        expect{ subject }.to raise_error(LoadError)
      end
    end

    context "with configurations" do

      before do
        Queri::XmlClient.configure_with(File.join(File.dirname(__FILE__), 'config.yml'))
        report.stub(:class).and_return( Queri::Realtime::Queues )
      end

      it "should respond" do
        expect{ subject }.to_not raise_error
      end

      it "should call the XMLRPC client" do
        xml_client = Queri::XmlClient.class_variable_get(:@@server)
        Queri::XmlClient.class_variable_set(:@@server, @client)
        subject
        @client.should have_received(:call)
        Queri::XmlClient.class_variable_set(:@@server, xml_client)
      end

      context "given no arguments" do
        subject { Queri::XmlClient.send_request }

        it "should raise ArgumentError" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end

      context "given an empty queues array" do
        subject { Queri::XmlClient.send_request([], report) }

        it "should raise ArgumentError" do
          expect{ subject }.to raise_error(ArgumentError)
        end
      end

      context "given a Stats report object" do
        context "and period_start or period_end are nil" do
          let(:report) { double(Queri::Stats::AnsweredCalls::AllCalls) }
          let(:period_start) { Time.now - 10 }
          let(:period_end) { nil }

          subject { Queri::XmlClient.send_request(queues, report, period_start, period_end) }

          it "should raise ArgumentError" do
            expect{ subject }.to raise_error(ArgumentError)
          end
        end
      end

      context "given a Realtime report object" do
        context "and period_start or period_end are not nil" do
          let(:period_start) { Time.now - 10 }
          let(:period_end) { nil }

          subject { Queri::XmlClient.send_request(queues, report, period_start, period_end) }

          it "should raise ArgumentError" do
            expect{ subject }.to raise_error(ArgumentError)
          end
        end
      end
    end
  end
end
