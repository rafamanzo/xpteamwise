require 'csv'

module XpTeamWise
  module Data
    module Reader
      class CSVToData # Longer name to avoid name clash with Ruby's CSV class
        class << self
          def read(path)
            members = []

            CSV.foreach(path) do |row|
              project1 = XpTeamWise::Data::Project.new(name: row[3])
              project2 = XpTeamWise::Data::Project.new(name: row[4])
              project3 = XpTeamWise::Data::Project.new(name: row[5])

              members << XpTeamWise::Data::Member.new(name: row[0],
                                                      email: row[1],
                                                      coach: (row[2] == 'true'),
                                                      projects: [project1, project2, project3])
            end

            members
          end

        end
      end
    end
  end
end
