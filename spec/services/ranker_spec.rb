require "spec_helper"
require "factory_bot"
describe League::Services::Ranker do
  subject { described_class }

  context "#rank_leaderboard" do
    let(:team_1_name) { "team1" }
    let(:team_1_points) { 1 }
    let(:team_2_name) { "team2" }
    let(:team_2_points) { 2 }
    let(:team_3_name) { "team3" }
    let(:team_3_points) { 3 }
    let(:leaderboard) do
      {
        team_1_name => team_1_points,
        team_2_name => team_2_points,
        team_3_name => team_3_points,
      }
    end

    context "has clear winners and losers" do
      it "returns rankings as expected" do
        results = subject.rank_leaderboard(leaderboard)
        expect(results.size).to eq 3
        output_result = results[0]
        expect(output_result.name).to eq team_3_name
        expect(output_result.points).to eq team_3_points
        expect(output_result.rank).to eq 1
        output_result = results[1]
        expect(output_result.name).to eq team_2_name
        expect(output_result.points).to eq team_2_points
        expect(output_result.rank).to eq 2
        output_result = results[2]
        expect(output_result.name).to eq team_1_name
        expect(output_result.points).to eq team_1_points
        expect(output_result.rank).to eq 3
      end
    end
    context "has a winner and a tie" do
      let(:team_1_name) { "hello" }
      let(:team_1_points) { 1 }
      let(:team_2_name) { "arrow" }
      let(:team_2_points) { 3 }

      it "returns rankings as expected" do
        results = subject.rank_leaderboard(leaderboard)
        expect(results.size).to eq 3
        output_result = results[0]
        expect(output_result.name).to eq team_2_name
        expect(output_result.points).to eq team_2_points
        expect(output_result.rank).to eq 1
        output_result = results[1]
        expect(output_result.name).to eq team_3_name
        expect(output_result.points).to eq team_3_points
        expect(output_result.rank).to eq 1
        output_result = results[2]
        expect(output_result.name).to eq team_1_name
        expect(output_result.points).to eq team_1_points
        expect(output_result.rank).to eq 3
      end
    end
  end
end
