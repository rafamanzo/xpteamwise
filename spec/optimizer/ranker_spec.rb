require 'spec_helper'

describe XpTeamWise::Optimizer::Ranker do
  describe 'class method' do
    describe 'rank' do
      let(:size) { 4 }
      let(:population) { XpTeamWise::Optimizer::Population.new(size: size, members: [FactoryGirl.build(:member)]) }

      before do
        population.chromossomes.each do |chromossome|
          expect(chromossome).to receive(:teams).and_return([double('Team')])
        end

        expect(described_class).to receive(:score_team).and_return(1).exactly(size).times
      end

      it 'is expected to set the Chromossomes scores with the team acuumulated ones' do
        described_class.rank(population)

        population.chromossomes.each do |chromossome|
          expect(chromossome.score).to eq(1)
        end
      end
    end

    describe 'score_team' do
      let(:project1) { FactoryGirl.build(:project) }
      let(:project2) { FactoryGirl.build(:project) }
      let(:project3) { FactoryGirl.build(:project) }
      let(:member) { FactoryGirl.build(:member, projects: [project1, project2, project3]) }
      let(:coach) { FactoryGirl.build(:member, :coach, projects: [project3, project2, project1]) }

      context 'without bonuses' do
        it 'is expected to compute the score from member project priorities' do
          team1 = XpTeamWise::Optimizer::Team.new(project: project1, members: [member])
          team2 = XpTeamWise::Optimizer::Team.new(project: project2, members: [member, member])
          team3 = XpTeamWise::Optimizer::Team.new(project: project3, members: [member, member, member])

          expect(described_class.score_team(team1, team1.members.count + 1, team1.members.count + 1)).to eq(described_class::FIRST_OPTION_PTS)
          expect(described_class.score_team(team2, team2.members.count + 1, team2.members.count + 1)).to eq(2*described_class::SECOND_OPTION_PTS)
          expect(described_class.score_team(team3, team3.members.count + 1, team3.members.count + 1)).to eq(3*described_class::THIRD_OPTION_PTS)
        end
      end

      context 'with coach bonus' do
        it 'is expected to compute the score from member project priorities and apply bonus' do
          team1 = XpTeamWise::Optimizer::Team.new(project: project3, members: [coach])
          team2 = XpTeamWise::Optimizer::Team.new(project: project2, members: [coach, coach])
          team3 = XpTeamWise::Optimizer::Team.new(project: project1, members: [coach, coach, coach])

          expect(described_class.score_team(team1, team1.members.count + 1, team1.members.count + 1)).to eq(described_class::FIRST_OPTION_PTS*described_class::BONUS_MULTIPLIER)
          expect(described_class.score_team(team2, team2.members.count + 1, team2.members.count + 1)).to eq(2*described_class::SECOND_OPTION_PTS*described_class::BONUS_MULTIPLIER)
          expect(described_class.score_team(team3, team3.members.count + 1, team3.members.count + 1)).to eq(3*described_class::THIRD_OPTION_PTS*described_class::BONUS_MULTIPLIER)
        end
      end

      context 'with proper size bonus' do
        it 'is expected to compute the score from member project priorities and apply bonus' do
          team1 = XpTeamWise::Optimizer::Team.new(project: project1, members: [member])
          team2 = XpTeamWise::Optimizer::Team.new(project: project2, members: [member, member])
          team3 = XpTeamWise::Optimizer::Team.new(project: project3, members: [member, member, member])

          expect(described_class.score_team(team1, 0, team1.members.count)).to eq(described_class::FIRST_OPTION_PTS*described_class::BONUS_MULTIPLIER)
          expect(described_class.score_team(team2, 0, team2.members.count)).to eq(2*described_class::SECOND_OPTION_PTS*described_class::BONUS_MULTIPLIER)
          expect(described_class.score_team(team3, 0, team3.members.count)).to eq(3*described_class::THIRD_OPTION_PTS*described_class::BONUS_MULTIPLIER)
        end
      end
    end
  end
end
