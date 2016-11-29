require 'spec_helper'

RSpec.describe ScoreKeeper do

  let(:invalid) do
    [
      "abc123: +1",
      "abc +1",
      "abc: 1",
      "abc: -",
      "abc: +",
    ]
  end

  let(:valid) do
    [
      "abc: +1",
      "abc: -1",
      "abc: 0",
      "def: +2\nabc: +1",
      "abc: +1\ndef: +2",
      "Heather: +4\nChen: +10\nHelga: +22\nHeather: -7\nChen: +2\nBalthazar: -1"
    ]
  end

  let(:scores) do
    [
      "abc: +1",
      "abc: -1",
      "stuff",
      "def: +2\nabc: +1",
      "abc: +1\ndef: +2",
      "Heather: +4\nChen: +10\nHelga: +22\nHeather: -7\nChen: +2\nBalthazar: -1"
    ].map { |string| described_class.new(string) } 
  end

  describe "#add" do
    it "The input string will always be valid." do
      expect(scores[0].to_s).to eq("abc: +1")
      expect(scores[2].to_s).to eq("")
    end
  end

  describe "::valid?" do
    it "Items in the list will be separated by new line characters" do
       expect(described_class.valid?(valid[3])).to be(true)
    end
  end

  describe "#to_s" do
    it "The output names should be in alphabetical order." do
      expect(scores[3].to_s).to eq(valid[4])
      expect(scores[4].to_s).to eq(valid[4])
    end

    it "Scores can go negative" do
      expect(scores[5].to_s).to eq("Balthazar: -1\nChen: +12\nHeather: -3\nHelga: +22")
    end
  end
end
