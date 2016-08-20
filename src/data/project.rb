module XpTeamWise
  module Data
    class Project
      attr_reader :name

      def initialize(name: '')
        @name = name
      end
    end
  end
end
