module XpTeamWise
  module Optimizer
    class Chromossome
      attr_reader :genes

      def initialize(members=[])
        @members = members

        @genes = []
        @members.each { |m| @genes << rand(3) }
      end
    end
  end
end