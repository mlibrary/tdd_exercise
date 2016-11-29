require 'spec_helper'

RSpec.describe Record do
  let(:valid_names) do
    [ "abc" ].map { |name| described_class.new(name) }
  end

  let(:invalid_names) do
    [ "abc123" ].map { |name| described_class.new(name) }
  end

  let(:valid_scores) do
    [ "+1", "-1", "0" ].map {|score| described_class.new(nil, score) }
  end

  let(:invalid_scores) do
    [ "1", "-", "+" ].map {|score| described_class.new(nil, score) }
  end

  describe "#valid_name?" do
    it "Names will only ever contain letters." do
      expect(valid_names[0].valid_name?).to be(true)
      expect(invalid_names[0].valid_name?).to be(false)
    end
  end

  describe "#valid_score?" do
    it "Scores/points must be preceded by a + or - depending on whether it is positive or negative." do
      expect(valid_scores[0].valid_score?).to be(true)
      expect(valid_scores[1].valid_score?).to be(true)
      expect(invalid_scores[0].valid_score?).to be(false)
      expect(invalid_scores[1].valid_score?).to be(false)
      expect(invalid_scores[2].valid_score?).to be(false)
    end

    it "Zero shouldn't have a sign before it." do
      expect(valid_scores[2].valid_score?).to be(true)
    end
  end
end

