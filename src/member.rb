module XpTeamWise
  class Member
    attr_reader :name, :email, :coach

    def initialize(name: '', email: '', coach: false)
      @name = name
      @email = email
      @coach = coach
    end
  end
end
