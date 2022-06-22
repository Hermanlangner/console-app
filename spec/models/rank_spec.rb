require "spec_helper"

describe League::Models::Rank do
  subject { described_class.new("name", 1, 5) }

  context "#initialize" do
    it "has an params set" do
      expect(subject.name).to eq "name"
      expect(subject.points).to eq 1
      expect(subject.rank).to eq 5
    end
  end
end
