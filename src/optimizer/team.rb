module XpTeamWise
  module Optimizer
    class Team
      attr_reader :project, :members

      def initialize(project: nil, members: [])
        @project = project
        @members = members
      end

      def to_s
        str = "#{project.name}"

        members.each do |member|
          str << "\n\t"
          str << (member.coach ? "* " : "- ")
          str << member.name
        end

        str
      end

      def has_coach?
        self.members.each { |member| return true if member.coach }
        false
      end
    end
  end
end
