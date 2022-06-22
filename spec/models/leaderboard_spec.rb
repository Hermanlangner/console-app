require "spec_helper"

describe League::Models::Leaderboard do
  let(:board) { {} }
  subject { described_class.new(board) }

  context "#initialize" do
    it "has an empty board" do
      expect(subject.board).to eq({})
    end
  end

  context "#update_match_results" do
    let(:team_name) { "team1" }
    let(:team_point) { 4 }
    let(:team_results) { [build(:team_result, name: team_name, points: team_point)] }

    context "the team is not on the leaderboard" do
      it "adds the team to the board" do
        subject.update_match_results(team_results)
        board = subject.board
        expect(board[team_name]).to eq team_point
      end
    end

    context "the team is on the leaderboard" do
      let(:team_name) { "teamfsadsa1" }
      let(:already_added_point) { 2 }
      let(:board) { { team_name => already_added_point } }
      it "adds the team to the board" do
        subject.update_match_results(team_results)
        board = subject.board
        expect(board[team_name]).to eq (team_point + already_added_point)
      end
    end
  end

  context "#team_on_leaderboard" do
    let(:team_name) { "team1423" }
    context "the name is not present" do
      let(:board) { { team2: 55 } }
      it "returns false" do
        expect(subject.team_on_leaderboard?(team_name)).to be false
      end
    end
    context "the name is not present" do
      let(:board) { { team_name => 55 } }
      it "returns false" do
        expect(subject.team_on_leaderboard?(team_name)).to be true
      end
    end
  end
end
