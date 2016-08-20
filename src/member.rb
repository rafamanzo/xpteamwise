module XpTeamWise
  class Member
    attr_reader :name, :email, :coach, :projects

    def initialize(name: '', email: '', coach: false, projects: [nil, nil, nil])
      @name = name
      @email = email
      @coach = coach
      @projects = projects
    end
  end
end
