require "spec_helper"

describe League::ObjectFactories::TeamResultFactory do
  subject { described_class }

  context "#create" do
    it "correctly Team1 wins a game" do
      team_results = subject.create("Team1 15, Team2 8")
      expect(team_results[0].name).to eq "Team1"
      expect(team_results[0].points).to eq 3
      expect(team_results[1].name).to eq "Team2"
      expect(team_results[1].points).to eq 0
    end
    it "correctly Team1 Draws a game" do
      team_results = subject.create("Team1 5, Team2 5")
      expect(team_results[0].name).to eq "Team1"
      expect(team_results[0].points).to eq 1
      expect(team_results[1].name).to eq "Team2"
      expect(team_results[1].points).to eq 1
    end
    it "correctly Team1 Loses a game" do
      team_results = subject.create("Team1 5, Team2 8")
      expect(team_results[0].name).to eq "Team1"
      expect(team_results[0].points).to eq 0
      expect(team_results[1].name).to eq "Team2"
      expect(team_results[1].points).to eq 3
    end
  end
end
