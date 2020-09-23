module XpTeamWise
  module Optimizer
    class Ranker
      FIRST_OPTION_PTS = 8
      SECOND_OPTION_PTS = 3
      THIRD_OPTION_PTS = 1

      BONUS_COACH = 20
      BONUS_MULTIPLIER = 2

      MIN_SIZE=4
      MAX_SIZE=8

      class << self
        def rank(population)
          population.chromossomes.each do |chromossome|
            if chromossome.score.nil?
              teams = chromossome.teams
              chromossome.score = 0

              teams.each { |team| chromossome.score += score_team(team) }
            end
          end
        end

        def score_team(team, min_size=MIN_SIZE, max_size=MAX_SIZE)
          score = 0

          team.members.each do |member|
            case member.projects.find_index(team.project)
              when 0
                score += FIRST_OPTION_PTS
              when 1
                score += SECOND_OPTION_PTS
              when 2
                score += THIRD_OPTION_PTS
            end
          end

          score += BONUS_COACH / team.number_of_coaches if team.has_coach?

          score *= BONUS_MULTIPLIER if team.respect_sizes?(min_size, max_size)

          score
        end
      end
    end
  end
end
