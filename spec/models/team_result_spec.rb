require "spec_helper"

describe League::Models::TeamResult do
  subject { described_class.new("name", 1) }

  context "#initialize" do
    it "has an params set" do
      expect(subject.name).to eq "name"
      expect(subject.points).to eq 1
    end
  end
end
