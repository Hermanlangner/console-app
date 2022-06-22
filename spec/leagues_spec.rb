require "spec_helper"

describe League do
  subject { described_class.run_league(["Team1 15, Team2 8"]) }

  context "#create" do
    it "correctly Team1 wins a game" do
      team_results = subject
      expect(team_results[0].name).to eq "Team1"
      expect(team_results[0].points).to eq 3
      expect(team_results[1].name).to eq "Team2"
      expect(team_results[1].points).to eq 0
    end
  end
end
