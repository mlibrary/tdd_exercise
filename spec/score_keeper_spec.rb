require 'spec_helper'

RSpec.describe ScoreKeeper do
  let(:sk) do
    described_class.new
  end

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


  describe "The input string will always be valid." do

    it "Names will be followed by a colon and a single space" do
      expect(sk.valid?(valid[0])).to be(true)
      expect(sk.valid?(invalid[1])).to be(false)
    end

    it "The output names should be in alphabetical order." do
      expect(sk.add(valid[3])).to eq(valid[4])
      expect(sk.add(valid[4])).to eq(valid[4])
    end

    it "Scores can go negative" do
      expect(sk.add(valid[5])).to eq("Balthazar: -1\nChen: +12\nHeather: -3\nHelga: +22")
    end

    it "items in the list will be separated by new line characters" do
       expect(sk.valid?(valid[3])).to be(true)
    end

  end
end
