require 'spec_helper'

module Queri
  module Helpers
    describe TimeHelpers do
      describe "::time_string_to_seconds" do
        let(:time) { "01:00 &nbsp;" }

        subject { TimeHelpers.time_string_to_seconds(time) }

        it "should respond" do
          expect{ subject }.to_not raise_error
        end

        it "should return a Fixnum" do
          subject.should be_a Fixnum
        end

        it "should properly parse a base case time" do
          TimeHelpers.time_string_to_seconds("00:00 &nbsp;").should eq 0
        end

        context "given leading non-numeric characters" do
          let(:time) { "a time01:00" }

          it "should accurately parse the string" do
            subject.should eq 60
          end
        end

        context "given seconds in the time string" do
          let(:seconds_count) { 23 }
          let(:time) { "00:#{seconds_count} &nbsp;" }

          it "should return that value" do
            subject.should eq seconds_count
          end

          context "greater than the number of seconds in a minute" do
            let(:seconds_count) { 61 }
            let(:time) { "00:#{seconds_count} &nbsp;" }

            it "should return that value" do
              subject.should eq seconds_count
            end
          end
        end

        context "given minutes in the time string" do
          let(:minutes_count) { 5 }
          let(:time) { "#{minutes_count}:00 &nbsp;" }

          it "should return that value cast to seconds" do
            subject.should eq minutes_count * 60
          end

          context "and seconds" do
            let(:seconds_count) { 21 }
            let(:time) { "#{minutes_count}:#{seconds_count} &nbsp;" }

            it "should convert that value appropriately" do
              subject.should eq (minutes_count * 60) + seconds_count
            end
          end

          context "greater than the number of minutes in an hour" do
            let(:minutes_count) { 61 }
            let(:time) { "#{minutes_count}:00 &nbsp;" }

            it "should return that value" do
              subject.should eq minutes_count * 60
            end
          end
        end

        context "given hours in the time string" do
          let(:hours_count) { 2 }
          let(:time) { "#{hours_count}:00:00 &nbsp;" }

          it "should return that value cast to seconds" do
            subject.should eq hours_count * 3600
          end

          context "and minutes" do
            let(:minutes_count) { 35 }
            let(:time) { "#{hours_count}:#{minutes_count}:00 &nbsp;" }

            it "should convert that value appropriately" do
              subject.should eq (hours_count * 3600) + (minutes_count * 60)
            end
          end

          context "and seconds" do
            let(:seconds_count) { 17 }
            let(:time) { "#{hours_count}:00:#{seconds_count} &nbsp;" }

            it "should convert that value appropriately" do
              subject.should eq (hours_count * 3600) + seconds_count
            end
          end

          context "greater than the number of hours in a day" do
            let(:hours_count) { 25 }
            let(:time) { "#{hours_count}:00:00 &nbsp;" }

            it "should return that value" do
              subject.should eq hours_count * 3600
            end
          end
        end
      end
    end
  end
end
