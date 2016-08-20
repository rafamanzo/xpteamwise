require 'csv'

module XpTeamWise
  module Data
    module Reader
      class CSVToData # Longer name to avoid name clash with Ruby's CSV class
        def initialize(path, name_col: 'name', email_col: 'email', coach_col: 'coach', first_project_col: 'project1', second_project_col: 'project2', third_project_col: 'project3')
          @path = path

          @name_col = nil
          @email_col = nil
          @coach_col = nil
          @first_project_col = nil
          @second_project_col = nil
          @third_project_col = nil

          CSV.read(@path).first.each.with_index do |col, index|
            case col
              when name_col
                @name_col = index
              when email_col
                @email_col = index
              when coach_col
                @coach_col = index
              when first_project_col
                @first_project_col = index
              when second_project_col
                @second_project_col = index
              when third_project_col
                @third_project_col = index
            end
          end
        end
      end
    end
  end
end
