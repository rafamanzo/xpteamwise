module XpTeamWise
  module Optimizer
    class Chromossome
      attr_reader :genes
      attr_accessor :score

      def initialize(members=[])
        @members = members

        @genes = []
        @members.each { |m| @genes << rand(3) }
      end

      def teams
        projects = {}
        @members.each_index do |index|
          if projects[@members[index].projects[@genes[index]].name].nil?
            projects[@members[index].projects[@genes[index]].name] = {project: @members[index].projects[@genes[index]], members: []}
          end

          projects[@members[index].projects[@genes[index]].name][:members] << @members[index]
        end

        projects.map { |name, attributes| Team.new(**attributes) }
      end
    end
  end
end
