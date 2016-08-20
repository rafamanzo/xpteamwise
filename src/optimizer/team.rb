module XpTeamWise
  module Optimizer
    class Team
      attr_reader :project, :members

      def initialize(project: nil, members: [])
        @project = project
        @members = members
      end

      def to_s
        str = "#{project.name} (score: #{Ranker::score_team(self)})"

        members.each do |member|
          str << "\n\t"
          str << (member.coach ? "* " : "- ")
          str << member.name
          str << " (#{(member.projects.find_index(project) + 1)})"
        end

        str
      end

      def has_coach?
        self.members.each { |member| return true if member.coach }
        false
      end

      def respect_sizes?(min, max)
        self.members.count <= max && self.members.count >= min
      end
    end
  end
end
