module XpTeamWise
  module Optimizer
    class Team
      attr_reader :project, :members

      def initialize(project, members)
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
    end
  end
end
