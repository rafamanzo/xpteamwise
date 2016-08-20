module XpTeamWise
  module Optimizer
    class Team
      attr_reader :project, :members

      def initialize(project, members)
        @project = project
        @members = members
      end
    end
  end
end
